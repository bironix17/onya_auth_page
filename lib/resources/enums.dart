enum SignUpElements { FirstName, LastName, Email, Password }
enum SignInElements { Email, Password, ForgotPassword }
enum AuthTab{SignUp, SignIn}

enum AuthStatus {
  Failed_Email_Is_Busy,
  Failed_Password_Error,
  Failed_Network_Error,
  Failed_Login_Password_Error,
  Failed_Invalid_Email,
  Success,
  FirstSignIn
}

enum AuthProvider {
  Email,
  Facebook,
  Google,
  Apple,
  LinkedIn,
  Instagram,
}
