import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_authorization/authorization/bloc/bloc.dart';
import 'package:flutter_authorization/authorization/bloc/event.dart';
import 'package:flutter_authorization/authorization/enums.dart';
import 'package:flutter_authorization/authorization/ui/components/custom_button.dart';
import 'package:flutter_authorization/authorization/ui/components/custom_text_field.dart';
import 'package:flutter_authorization/authorization/ui/tabs/auth_social_services_switch.dart';

import 'package:flutter_authorization/resources/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  Map<SignInElements, dynamic> elementsData;
  Map<SignInElements, String> elementsErrorData;

  static const double horizontalPadding = 20;

  SignIn(this.elementsData, this.elementsErrorData);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: AuthServicesButtons(),
          ),

          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text("or sign in with email".toUpperCase(),
                style: TextStyle(
                  color: Color(0xFFB3B3B3),
                  fontSize: 14,
                  letterSpacing: 0.55,
                )),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomTextField(
                hintText: "Email",
                text: elementsData[SignInElements.Email],
                errorText: elementsErrorData[SignInElements.Email],
                callbackOnChanged: (value) =>
                    BlocProvider.of<AuthorizationBloc>(context).add(
                        ClickSignInElementEvent(SignInElements.Email, value))),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomTextField(
                hintText: "Password",
                text: elementsData[SignInElements.Password],
                errorText: elementsErrorData[SignInElements.Password],
                isPasswordField: true,
                callbackOnChanged: (value) =>
                    BlocProvider.of<AuthorizationBloc>(context).add(
                        ClickSignInElementEvent(
                            SignInElements.Password, value))),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.info,
                  color: AppColors.primary,
                  size: 14,
                ),
                SizedBox(width: 4),
                Text("forgot your password?".toUpperCase(),
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),

          Padding(
              padding: EdgeInsets.only(top: 30),
              child: CustomButton(
                  text: "sign in",
                  callbackOnPressed: () =>
                      BlocProvider.of<AuthorizationBloc>(context)
                          .add(SubmitSignInEvent()))),

          // в целом, все выглядит вполне неплохо, аккуратно и читабельно, но вот эту кнопку я бы показывал только в том случае, если я уже авторизован
          Padding(
              padding: EdgeInsets.only(top: 30),
              child: CustomButton(
                  text: "log out",
                  callbackOnPressed: () =>
                      BlocProvider.of<AuthorizationBloc>(context)
                          .add(SubmitLogOutEvent()))),
        ],
      ),
    );
  }
}
