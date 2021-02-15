import 'package:flutter/widgets.dart';
import 'package:flutter_authorization/resources/enums.dart';

class AuthorizationState {}

class LoadingState extends AuthorizationState {}

class NormalState extends AuthorizationState {

  final Map<SignInElements, dynamic> signInElements;
  final Map<SignUpElements, dynamic> signUpElements;

  final Map<SignInElements, String> signInElementErrors;
  final Map<SignUpElements, String> signUpElementErrors;

  final String authStatus;

  NormalState(
      {@required this.signInElements,
      @required this.signUpElements,
      @required this.signInElementErrors,
      @required this.signUpElementErrors,
      this.authStatus = ""});


  NormalState copyWith({String authStatus})=> NormalState(
      signInElements: this.signInElements,
      signUpElements: this.signUpElements,
      signInElementErrors: this.signInElementErrors,
      signUpElementErrors: this.signUpElementErrors,
      authStatus: authStatus ?? this.authStatus,
      );

}



// не применяется
class SuccessfullyAuthorizedState extends AuthorizationState {}
