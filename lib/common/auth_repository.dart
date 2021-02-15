import 'package:flutter_authorization/common/graphql.dart';
import 'package:flutter_authorization/common/services/auth_service.dart';
import 'package:flutter_authorization/resources/enums.dart';

class AuthRepository {
  AuthService _service;

  AuthRepository() {
    _service = AuthService(GraphQlLApi().client);
  }

  Future<bool> logOut() async => _service.logOut();

  Future<AuthStatus> signIn({String email, String password}) async =>
      _service.authorize(email, password);

  Future<AuthStatus> signUp(
          {String firstName,
          String lastName,
          String email,
          String password}) async =>
      _service.register(firstName, lastName, email, password);
}
