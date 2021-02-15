import 'package:flutter_authorization/authorization/bloc/event.dart';
import 'package:flutter_authorization/authorization/bloc/state.dart';
import 'package:flutter_authorization/common/auth_repository.dart';
import 'package:flutter_authorization/resources/enums.dart';
import 'package:flutter_authorization/resources/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {

  Map<SignUpElements, dynamic> _signUpElements = {};
  Map<SignInElements, dynamic> _signInElements = {};

  Map<SignInElements, String> _signInElementErrors = {};
  Map<SignUpElements, String> _signUpElementErrors = {};

  final AuthRepository _authRepository = AuthRepository();

  static const Map<AuthStatus, String> _authStatusMessage = {
    AuthStatus.Failed_Email_Is_Busy : "email занят",
    AuthStatus.Failed_Password_Error : "пароль некорректен",
    AuthStatus.Failed_Network_Error : "нет подключения к инету",
    AuthStatus.Failed_Login_Password_Error : "неверный логин/пароль",
    AuthStatus.Failed_Invalid_Email : "email некорректен",
    AuthStatus.Success : "Успешно",
    AuthStatus.FirstSignIn : "Первый вход"
  };

  AuthorizationBloc()
      : super(NormalState(
            signInElements: {},
            signUpElements: {},
            signInElementErrors: {},
            signUpElementErrors: {}));


  NormalState get normalState => NormalState(
      signInElements: _signInElements,
      signUpElements: _signUpElements,
      signInElementErrors: _signInElementErrors,
      signUpElementErrors: _signUpElementErrors);


  @override
  Stream<AuthorizationState> mapEventToState(AuthorizationEvent event) async* {

    if (event is SubmitSignInEvent) {
      yield LoadingState();

      _signInElements = event.elements;
      _signInElementErrors = validateSignInElements(_signInElements);

      if (_signInElementErrors.length == 0) {
        final result = await _authRepository.signIn(
          email: _signInElements[SignInElements.Email],
          password: _signInElements[SignInElements.Password],
        );

        switch(result){
          case AuthStatus.Success :
            yield normalState.copyWith(authStatus: _authStatusMessage[AuthStatus.Success]);
            break;

          case AuthStatus.Failed_Login_Password_Error :
            yield normalState.copyWith(authStatus: _authStatusMessage[AuthStatus.Failed_Login_Password_Error]);
            break;
        }

      } else {
        yield normalState;
      }
    }

    if (event is SubmitSignUpEvent) {
      yield LoadingState();

      _signUpElements = event.elements;
      _signUpElementErrors = validateSignUpElements(_signUpElements);


      if (_signUpElementErrors.length == 0) {
        final result = await _authRepository.signUp(
          firstName: _signUpElements[SignUpElements.FirstName],
          lastName: _signUpElements[SignUpElements.LastName],
          email: _signUpElements[SignUpElements.Email],
          password: _signUpElements[SignUpElements.Password],
        );

        if (result == AuthStatus.Success)
          yield normalState.copyWith(authStatus: "Зареганно");
        else if (result == AuthStatus.Failed_Email_Is_Busy)
          yield normalState.copyWith(authStatus: "email занят");
        else if (result == AuthStatus.Failed_Invalid_Email)
          yield normalState.copyWith(authStatus: "email некорректен");
        else if (result == AuthStatus.Failed_Password_Error)
          yield normalState.copyWith(authStatus: "пароль некорректен");
        else if (result == AuthStatus.Failed_Network_Error)
          yield normalState.copyWith(authStatus: "нет подключения к инету");
      } else {
        yield normalState;
      }
    }

    if (event is SocialSignInEvent)
      print(event);

    if (event is SocialSignUpEvent)
      print(event);
  }



  bool checkTextValue(dynamic textValue) {
    if (textValue == null || textValue.toString().trim().isEmpty) return false;
    return true;
  }

  Map<SignUpElements, String> validateSignUpElements(
      Map<SignUpElements, dynamic> elementsData) {
    Map<SignUpElements, String> signUpFieldErrors = {};


    if(!RegExp(TextInputValidators.emailPattern).hasMatch(elementsData[SignUpElements.Email]))
      signUpFieldErrors[SignUpElements.Email] = "Please enter a valid email";

    if (!checkTextValue(elementsData[SignUpElements.Email]))
      signUpFieldErrors[SignUpElements.Email] = "Please enter your email address";

    if (!checkTextValue(elementsData[SignUpElements.FirstName]))
      signUpFieldErrors[SignUpElements.FirstName] = "Please enter a first name";

    if (!checkTextValue(elementsData[SignUpElements.LastName]))
      signUpFieldErrors[SignUpElements.LastName] = "Please enter a last name";

    if (!checkTextValue(elementsData[SignUpElements.Password]))
      signUpFieldErrors[SignUpElements.Password] =
          "Please enter a your password";

    return signUpFieldErrors;
  }


  Map<SignInElements, String> validateSignInElements(
      Map<SignInElements, dynamic> elementsData) {
    Map<SignInElements, String> signInFieldErrors = {};

    if(!RegExp(TextInputValidators.emailPattern).hasMatch(elementsData[SignInElements.Email]))
      signInFieldErrors[SignInElements.Email] = "Please enter a valid email";

    if (!checkTextValue(elementsData[SignInElements.Email]))
      signInFieldErrors[SignInElements.Email] = "Please enter your email address";

    if (!checkTextValue(elementsData[SignInElements.Password]))
      signInFieldErrors[SignInElements.Password] =
          "Please enter a your password";

    return signInFieldErrors;
  }
}
