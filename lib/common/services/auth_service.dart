import 'package:flutter_authorization/common/db.dart';
import 'package:flutter_authorization/common/services/queries/auth_queries.dart';
import 'package:flutter_authorization/resources/enums.dart';
import 'package:graphql/client.dart';

abstract class AuthServiceInterface {
  Future<AuthStatus> authorize(String email, String password);

  Future<AuthStatus> register(
      String firstName, String lastName, String email, String password);

  Future<bool> logOut();
}

class AuthService implements AuthServiceInterface {
  GraphQLClient _client;

  AuthService(this._client);

  @override
  Future<AuthStatus> authorize(String email, String password) async {
    final result = await _client.mutate(
        MutationOptions(documentNode: gql(AuthQueries.signIn), variables: {
      "username": email,
      "password": password,
    }));
    return _processSignIn(result, AuthProvider.Email);
  }

  @override
  Future<bool> logOut() async {
    final result = await _client
        .mutate(MutationOptions(documentNode: gql(AuthQueries.logout)));

    AppStorageHive().token = null;
    AppStorageHive().refreshToken = null;
    AppStorageHive().email = null;
    AppStorageHive().userId = null;

    if (result.hasException) return false;
    return true;
  }

  @override
  Future<AuthStatus> register(
      String firstName, String lastName, String email, String password) async {
    final result = await _client.mutate(MutationOptions(
        documentNode: gql(AuthQueries.signUp),
        variables: {
          "name": firstName,
          "last_name": lastName,
          "email": email,
          "password": password
        }));

    AuthStatus authStatus = checkAuthException(result);

    if (authStatus == AuthStatus.Success) {
      AppStorageHive().token = result.data['action']['tokens']['access_token'];
      AppStorageHive().refreshToken =
          result.data['action']['tokens']['refresh_token'];
      AppStorageHive().token = result.data['action']['tokens']['user']['email'];
    }

    return authStatus;
  }

  AuthStatus _processSignIn(QueryResult result, AuthProvider provider) {
    AuthStatus authStatus = checkAuthException(result);

    if (authStatus == AuthStatus.Success) {
      AppStorageHive().token = result.data['action']['access_token'];
      AppStorageHive().refreshToken = result.data['action']['refresh_token'];
      AppStorageHive().email = result.data['action']['email'];
      // }
    }
    return authStatus;
  }

  AuthStatus checkAuthException(QueryResult result) {

    if (result.hasException) {
      if (result.exception.graphqlErrors.isNotEmpty) {
        if (result.exception.graphqlErrors.first.raw
            .toString()
            .contains("The input.email has already been taken"))
          return AuthStatus.Failed_Email_Is_Busy;
        else if (result.exception.graphqlErrors.first.raw
            .toString()
            .contains("The input.password"))
          return AuthStatus.Failed_Password_Error;
        else if (result.exception.graphqlErrors.first.raw
            .toString()
            .contains("The input.email must be a valid email address"))
          return AuthStatus.Failed_Invalid_Email;
        else if (result.exception.graphqlErrors.first.raw
            .toString()
            .contains("Incorrect username or password"))
          return AuthStatus.Failed_Login_Password_Error;

        else assertWithMessage();
      }

      if (result.exception.clientException != null) {
        if (result.exception.clientException.message
            .toString()
            .contains("Failed host lookup"))
          return AuthStatus.Failed_Network_Error;
        else assertWithMessage();
      }
    }
    return AuthStatus.Success;
  }
}

  void assertWithMessage(){
    print("необработанная ошибка");
    assert(false);
  }

