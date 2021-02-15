import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_authorization/authorization/bloc/bloc.dart';
import 'package:flutter_authorization/authorization/bloc/event.dart';
import 'package:flutter_authorization/authorization/ui/components/auth_social_services_switch.dart';
import 'package:flutter_authorization/authorization/ui/components/custom_button.dart';
import 'package:flutter_authorization/authorization/ui/components/custom_text_field.dart';
import 'package:flutter_authorization/authorization/ui/components/privacy_policy.dart';
import 'package:flutter_authorization/authorization/ui/tabs/basic_tab.dart';
import 'package:flutter_authorization/resources/app_colors.dart';
import 'package:flutter_authorization/resources/app_fonts.dart';
import 'package:flutter_authorization/resources/app_values.dart';
import 'package:flutter_authorization/resources/enums.dart';
import 'package:flutter_authorization/resources/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_action_sheet/platform_action_sheet.dart';

class SignUp extends StatelessWidget {
  Map<SignUpElements, String> _elementsError;
  Map<SignUpElements, dynamic> _elements;

  Map<SignUpElements, TextEditingController> _elementsToControllers = {
    SignUpElements.Email: TextEditingController(),
    SignUpElements.Password: TextEditingController(),
    SignUpElements.LastName: TextEditingController(),
    SignUpElements.FirstName: TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return BasicTab(
      onNormalState: (state) {
        _elements = state.signUpElements;
        _elementsError = state.signUpElementErrors;
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
              facebookCallBack: ()=> BlocProvider.of<AuthorizationBloc>(context).add(SocialSignUpEvent(AuthProvider.Facebook)),
              googleCallBack: ()=> BlocProvider.of<AuthorizationBloc>(context).add(SocialSignUpEvent(AuthProvider.Google)),
              linkedinCallBack: ()=> BlocProvider.of<AuthorizationBloc>(context).add(SocialSignUpEvent(AuthProvider.LinkedIn)),
              instagramCallBack: ()=> BlocProvider.of<AuthorizationBloc>(context).add(SocialSignUpEvent(AuthProvider.Instagram)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text(
              'or sign up with email'.toUpperCase(),
              style: AppFonts.sfUiDisplayMedium.copyWith(
                color: Color(0xFFB3B3B3),
                fontSize: 13,
                letterSpacing: 0.55,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  hintText: "First name",
                  text: _elements[SignUpElements.FirstName],
                  formatter: TextInputFormatters.fieldWithOnlyLetters,
                  errorText: _elementsError[SignUpElements.FirstName],
                  controller: _elementsToControllers[SignUpElements.FirstName],
                )),
                SizedBox(width: 10),
                Expanded(
                    child: CustomTextField(
                  hintText: "Last name",
                  formatter: TextInputFormatters.fieldWithOnlyLetters,
                  text: _elements[SignUpElements.LastName],
                  controller: _elementsToControllers[SignUpElements.LastName],
                  errorText: _elementsError[SignUpElements.LastName],
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomTextField(
              hintText: "Email",
              text: _elements[SignUpElements.Email],
              controller: _elementsToControllers[SignUpElements.Email],
              errorText: _elementsError[SignUpElements.Email],
              textInputType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: CustomTextField(
              hintText: "Password",
              text: _elements[SignUpElements.Password],
              errorText: _elementsError[SignUpElements.Password],
              controller: _elementsToControllers[SignUpElements.Password],
              isPasswordField: true,
              textInputType: TextInputType.visiblePassword,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 30),
              child: CustomButton(
                  text: "create your account",
                  callbackOnPressed: () =>
                      BlocProvider.of<AuthorizationBloc>(context).add(
                          SubmitSignUpEvent(Map.fromEntries(
                              _elementsToControllers.entries.map(
                                  (e) => MapEntry(e.key, e.value.text))))))),
          Padding(
              padding: EdgeInsets.only(top: 40),
              child: _buildTitlePolicy(context)),

        ],
      ),
    );
  }

  Widget _buildTitlePolicy(BuildContext context) =>
      RichText(
        text: TextSpan(
          text:
          "By signing up, you agree to our Terms, Data Policy and\n Cookies Policy. Read our ",
          style: TextStyle(color: Colors.black),
          children: [
            TextSpan(
                text: "privacy policy",
                style: AppFonts.sfUiDisplayRegular
                    .copyWith(color: Color(0xFF4191DF)),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => _displayBottomSheet(context)
            )
          ],
        ),
        textAlign: TextAlign.center,
      );


  void _displayBottomSheet(BuildContext context) {
    PlatformActionSheet().displaySheet(
      context: context,
      message: Padding(
        padding: EdgeInsets.all(14),
        child: Text(
          'Choose document',
          style: AppFonts.sfUiDisplayRegular.copyWith(
            fontSize: 12,
            color: Color(0xFF848383),
          ),
        ),
      ),
      actions: [
        ActionSheetAction(
          text: 'Terms & conditions',
          onPressed: () => _navigateToPolicy(context),
        ),
        ActionSheetAction(
          text: 'Cookie policy',
          onPressed: () => _navigateToPolicy(context),
        ),
        ActionSheetAction(
          text: 'Privacy policy',
          onPressed: () => _navigateToPolicy(context),
        ),
        ActionSheetAction(
          text: 'Cancel',
          onPressed: () => Navigator.pop(context),
          isCancel: true,
          defaultAction: true,
        ),
      ],
    );
  }

  void _navigateToPolicy(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PrivacyPolicy(),
      ),
    );
  }
}
