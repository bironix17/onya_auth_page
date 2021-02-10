import 'package:flutter/widgets.dart';
import 'package:flutter_authorization/authorization/enums.dart';

class AuthorizationState {}

class LoadingState extends AuthorizationState {}

class NormalState extends AuthorizationState {
  // у стейта все поля должны быть final
  Map<SignInElements, dynamic> signInElements;
  Map<SignUpElements, dynamic> signUpElements;

  Map<SignInElements, String> signInElementErrors;
  Map<SignUpElements, String> signUpElementErrors;

  String authStatus;

  NormalState(
      {@required this.signInElements,
      @required this.signUpElements,
      @required this.signInElementErrors,
      @required this.signUpElementErrors,
      authStatus}) {
    this.authStatus = authStatus ?? "";
  }
}

class Message extends AuthorizationState {}

class SuccessfullyAuthorizedState extends AuthorizationState {}
