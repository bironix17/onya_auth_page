import 'package:flutter_authorization/authorization/enums.dart';

class AuthorizationEvent {}

//class InitEvent extends AuthorizationEvent{}

class ClickSignInElementEvent extends AuthorizationEvent {
  SignInElements signInElement;
  dynamic value;

  ClickSignInElementEvent(this.signInElement, [this.value = null]);
}

class SubmitSignInEvent extends AuthorizationEvent {}

class ClickSignUpElementEvent extends AuthorizationEvent {
  SignUpElements signUpElement;
  dynamic value;

  ClickSignUpElementEvent(this.signUpElement, [this.value = null]);
}

class SubmitSignUpEvent extends AuthorizationEvent {}

class SubmitLogOutEvent extends AuthorizationEvent {}
