import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_authorization/authorization/bloc/bloc.dart';
import 'package:flutter_authorization/authorization/bloc/event.dart';
import 'package:flutter_authorization/authorization/ui/components/auth_social_services_switch.dart';
import 'package:flutter_authorization/authorization/ui/components/custom_button.dart';
import 'package:flutter_authorization/authorization/ui/components/custom_text_field.dart';
import 'package:flutter_authorization/authorization/ui/tabs/basic_tab.dart';
import 'package:flutter_authorization/resources/app_colors.dart';
import 'package:flutter_authorization/resources/app_fonts.dart';
import 'package:flutter_authorization/resources/app_values.dart';
import 'package:flutter_authorization/resources/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {

  final Map<SignInElements, TextEditingController> elementsToControllers = {
    SignInElements.Email: TextEditingController(),
    SignInElements.Password: TextEditingController()
  };

  Map<SignInElements, dynamic> elements;
  Map<SignInElements, String> elementsError;



  @override
  Widget build(BuildContext context) {
    return BasicTab(
      onNormalState: (state) {
          elements = state.signInElements;
          elementsError = state.signInElementErrors;
        return _buildBody(context);
      },
      onLoadingState: (state) => Padding(padding : EdgeInsets.only(top : 100) ,child: Center(child: CircularProgressIndicator())),
    );
  }

  Widget _buildBody(BuildContext context) {

    return Container(
      color: AppColors.background,
      padding: EdgeInsets.symmetric(horizontal: AppValues.horizontalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: AuthServicesButtons(
              facebookCallBack: ()=> BlocProvider.of<AuthorizationBloc>(context).add(SocialSignInEvent(AuthProvider.Facebook)),
              googleCallBack: ()=> BlocProvider.of<AuthorizationBloc>(context).add(SocialSignInEvent(AuthProvider.Google)),
              linkedinCallBack: ()=> BlocProvider.of<AuthorizationBloc>(context).add(SocialSignInEvent(AuthProvider.LinkedIn)),
              instagramCallBack: ()=> BlocProvider.of<AuthorizationBloc>(context).add(SocialSignInEvent(AuthProvider.Instagram)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child :Text(
              'or sign up with email'.toUpperCase(),
              style: AppFonts.sfUiDisplayMedium.copyWith(
                color: Color(0xFFB3B3B3),
                fontSize: 13
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomTextField(
              hintText: "Email",
              text: elements[SignInElements.Email],
              errorText: elementsError[SignInElements.Email],
              controller: elementsToControllers[SignInElements.Email],
              textInputType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomTextField(
              hintText: "Password",
              text: elements[SignInElements.Password],
         //     formatter: TextInputFormatters.,
              errorText: elementsError[SignInElements.Password],
              controller: elementsToControllers[SignInElements.Password],
              isPasswordField: true,
              textInputType: TextInputType.visiblePassword,
            ),
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
                Text(
                  'Forgot your password?'.toUpperCase(),
                  style: AppFonts.sfUiDisplayBold.copyWith(
                    color: Theme.of(context).accentColor,
                    fontSize: 12,
                    letterSpacing: 0.55,
                  ))
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 30),
              child: CustomButton(
                  text: "sign in",
                  callbackOnPressed: () =>
                      BlocProvider.of<AuthorizationBloc>(context).add(
                          SubmitSignInEvent(Map.fromEntries(
                              elementsToControllers.entries.map(
                                  (e) => MapEntry(e.key, e.value.text))))))),
        ],
      ),
    );
  }
}
