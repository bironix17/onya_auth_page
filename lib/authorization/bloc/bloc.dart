import 'package:flutter_authorization/authorization/bloc/event.dart';
import 'package:flutter_authorization/authorization/bloc/state.dart';
import 'package:flutter_authorization/authorization/enums.dart';
import 'package:flutter_authorization/common/auth_repository.dart';
import 'package:flutter_authorization/common/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  // эти поля - особенно если их используешь только из стейта - должны быть приватными
  Map<SignUpElements, dynamic> signUpElementsData = {};
  Map<SignInElements, dynamic> signInElementsData = {};

  Map<SignInElements, String> signInElementErrors = {};
  Map<SignUpElements, String> signUpElementErrors = {};

  AuthRepository authRepository = AuthRepository();

  AuthorizationBloc()
      : super(NormalState(
            signInElements: {},
            signUpElements: {},
            signInElementErrors: {},
            signUpElementErrors: {}));

// этот метод тоже должен быть приватным
// для authStatus лучше у самого стейта сделать метод copyWith,
// а тут объявить обычный get метод. Впрочем, это вкусовщина и в таком подходе не вижу ничего плохого
  NormalState createDefaultNormalState({String text}) => NormalState(
      signInElements: signInElementsData,
      signUpElements: signUpElementsData,
      signInElementErrors: signInElementErrors,
      signUpElementErrors: signUpElementErrors,
      authStatus: text);

  @override
  Stream<AuthorizationState> mapEventToState(AuthorizationEvent event) async* {
    if (event is ClickSignInElementEvent) {
      signInElementsData[event.signInElement] = event.value;
      yield createDefaultNormalState();
    }

    if (event is SubmitSignInEvent) {
      final elementsErrors = validateSignInElements(signInElementsData);
      yield LoadingState();

      if (elementsErrors.length == 0) {
        final result = await authRepository.signIn(
          email: signInElementsData[SignInElements.Email],
          password: signInElementsData[SignInElements.Password],
        );

        signInElementErrors = elementsErrors;

        // тоже вкусовщина, но через switch это выглядело бы приятнее (наверное)

        // а еще лучше сделать мапу с ключем-enum'ом и значением-строкой
        if (result == AuthStatus.Success)
          yield createDefaultNormalState(text: "авторизированно");
        else if (result == AuthStatus.Failed_Login_Password_Error)
          yield createDefaultNormalState(text: "неверный логин/пароль");
        else if (result == AuthStatus.Failed_Network_Error)
          yield createDefaultNormalState(text: "нет подключения к инету");
      } else {
        signInElementErrors = elementsErrors;
        yield createDefaultNormalState();
      }
    }

// сохранять данные при каждом изменении текста. Учитывая, что ты свободно сохраняешь стейт
// при переключении таб тебе ничего не мешает подгружать данные только при сабмите
// а так у тебя каждый символ спамится событие и, более того, yield'ится стейт
    if (event is ClickSignUpElementEvent) {
      signUpElementsData[event.signUpElement] = event.value;
      yield createDefaultNormalState();
    }

// данные стоит сохранять именно в подобных событиях
    if (event is SubmitSignUpEvent) {
      final elementsErrors = validateSignUpElements(signUpElementsData);
      signUpElementErrors = elementsErrors;

      yield LoadingState();

      if (elementsErrors.length == 0) {
        final result = await authRepository.signUp(
          firstName: signUpElementsData[SignUpElements.FirstName],
          lastName: signUpElementsData[SignUpElements.LastName],
          email: signUpElementsData[SignUpElements.Email],
          password: signUpElementsData[SignUpElements.Password],
        );

        if (result == AuthStatus.Success)
          yield createDefaultNormalState(text: "Зареганно");
        else if (result == AuthStatus.Failed_Email_Is_Busy)
          yield createDefaultNormalState(text: "email занят");
        else if (result == AuthStatus.Failed_Invalid_Email)
          yield createDefaultNormalState(text: "email некорректен");
        else if (result == AuthStatus.Failed_Password_Error)
          yield createDefaultNormalState(text: "пароль некорректен");
        else if (result == AuthStatus.Failed_Network_Error)
          yield createDefaultNormalState(text: "нет подключения к инету");
      } else {
        signUpElementErrors = elementsErrors;
        yield createDefaultNormalState();
      }
    }

    if (event is SubmitLogOutEvent) {
      yield LoadingState();

      final result = await authRepository.logOut();

      if (result)
        yield createDefaultNormalState(text: "вышел");
      else
        yield createDefaultNormalState(text: "не вышел");
    }
  }

  bool checkTextValue(dynamic textValue) {
    if (textValue == null || textValue.toString().trim().isEmpty) return false;
    return true;
  }

  Map<SignUpElements, String> validateSignUpElements(
      Map<SignUpElements, dynamic> elementsData) {
    Map<SignUpElements, String> signUpFieldErrors = {};

    if (!checkTextValue(elementsData[SignUpElements.Email]))
      signUpFieldErrors[SignUpElements.Email] = "Please enter a valid email";

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

    if (!checkTextValue(elementsData[SignInElements.Email]))
      signInFieldErrors[SignInElements.Email] = "Please enter a valid email";

    if (!checkTextValue(elementsData[SignInElements.Password]))
      signInFieldErrors[SignInElements.Password] =
          "Please enter a your password";

    return signInFieldErrors;
  }
}
