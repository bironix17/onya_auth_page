import 'package:flutter_authorization/resources/enums.dart';

class AuthorizationEvent {}

class SubmitSignInEvent extends AuthorizationEvent {
  final Map<SignInElements, dynamic> elements ;

  SubmitSignInEvent(this.elements);
}



class SubmitSignUpEvent extends AuthorizationEvent {
  final Map<SignUpElements, dynamic> elements ;

  SubmitSignUpEvent(this.elements);
}

class SocialSignInEvent extends AuthorizationEvent {
  final AuthProvider authProvider;

  SocialSignInEvent(this.authProvider);
}


class SocialSignUpEvent extends AuthorizationEvent {
  final AuthProvider authProvider;

  SocialSignUpEvent(this.authProvider);
}