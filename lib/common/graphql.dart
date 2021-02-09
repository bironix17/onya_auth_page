import 'package:flutter_authorization/common/disk.dart';
import 'package:graphql/client.dart';

const String _baseUrl = "https://api.onya.miura.tech/graphql";

class GraphQlLApi {


  GraphQlLApi() {
    final _httpLink = HttpLink(uri :_baseUrl);

    final _authLink = AuthLink(getToken: () async => 'Bearer ${AppStorageHive().token}');

    client = GraphQLClient(
      cache: InMemoryCache(),
      link: _authLink.concat(_httpLink),
    );
  }

  GraphQLClient client;
  GraphQLCustomClient customClient;
}

class GraphQLCustomClient {
  GraphQLClient client;

  GraphQLCustomClient() {
    client = newClient;
  }

  GraphQLClient get newClient {
    final httpLink = HttpLink(uri : _baseUrl);

    final authLink = AuthLink(
      getToken: () => 'Bearer ${AppStorageHive().token}'
    );

    return GraphQLClient(
      cache: InMemoryCache(),
      link: authLink.concat(httpLink),
    );
  }

  Future<QueryResult> query (QueryOptions options) async{
    final bool isSuccess = await aproveOrUpdateToken();

    if (isSuccess){
      final result = await client.query(options);

      if (result.hasException)
        processGraphQlException(result.exception);
      else
        return result;
    }
  }


  Future<QueryResult> mutate (MutationOptions options) async{
    final bool isSuccess = await aproveOrUpdateToken();

    if (isSuccess){
      final result = await client.mutate(options);

      if (result.hasException)
        processGraphQlException(result.exception);
      else
        return result;
    }
  }


// проверка актуальсноти токена или его обновление
  Future<bool> aproveOrUpdateToken() async {

    // проверка существования токена в db
    if (AppStorageHive().refreshToken == null) return false;

    if(!(await isAuth())){
      final result = await client.mutate(MutationOptions(
          documentNode: gql(refreshTokenQuery),
          variables: {
            'refresh_token': AppStorageHive().refreshToken,
          },
          fetchPolicy: FetchPolicy.networkOnly
      ));
      if(result.hasException){
        print('refresh token failure');
        processGraphQlException(result.exception);
      }else{
        AppStorageHive().token = result.data['action']['access_token'];
        AppStorageHive().refreshToken = result.data['action']['refresh_token'];
        client = newClient;
        print("Refresh token success");
      }
    }
    return true;
  }

  Future<bool> isAuth() async{
    final result = await client.query(
      QueryOptions(
        documentNode: gql(checkQuery),
        fetchPolicy: FetchPolicy.cacheAndNetwork
      )
    );

    bool isExceptionFlag = false;

    if (result.hasException) {
      if (result.exception.graphqlErrors != null &&
          result.exception.graphqlErrors.isNotEmpty &&
          result.exception.graphqlErrors.first.raw.toString().contains(
              'Unauthenticated'))
        isExceptionFlag = true;
    }
    else
      processGraphQlException(result.exception);

    return !isExceptionFlag;
  }

  processGraphQlException(OperationException exception){
    var clientException = exception.clientException;
    var graphQLError = exception.graphqlErrors;

    print(exception.clientException.message);
    print(exception.graphqlErrors);
  }


  static const String refreshTokenQuery = r'''     
mutation refreshToken($refresh_token: String!)
{ action: refreshToken
      (
        input:{
          refresh_token: $refresh_token,
        }
      )
	{
    access_token,
    refresh_token
  }
 }
''';

  static const String checkQuery = r'''
query {
  me {
    id,
    name,
  }
}
''';

}
