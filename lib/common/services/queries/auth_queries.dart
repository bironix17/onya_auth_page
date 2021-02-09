class AuthQueries {
  static const String signIn = r'''
mutation login($username: String!, $password: String!)
{ action: login
      (input: {
    		username: $username,
    		password: $password,
  }) {
    access_token,
    refresh_token,
    user {
      id,
      profile_filled
      email_verified_at,
      email,
      trade {
        id
      },
      position_id,
      address
    }
  }
 }
''';

  static const String signUp = r'''
mutation register($name: String!, $last_name: String!, $email: String!, $password: String!)
{ action: register
      (input: {
  		  name: $name,
    		last_name: $last_name,
    		email: $email,
    		password: $password,
    		password_confirmation: $password
  }) {
    tokens {
    	access_token,
      refresh_token,
      user {
        email
      }
    },
    status
  }
 }
''';


  static String logout = r'''
mutation logout()
{action: logout {
    message,
    status
  }
}
''';
}