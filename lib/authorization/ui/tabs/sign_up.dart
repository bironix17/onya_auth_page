import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_authorization/authorization/bloc/bloc.dart';
import 'package:flutter_authorization/authorization/bloc/event.dart';
import 'package:flutter_authorization/authorization/enums.dart';
import 'package:flutter_authorization/authorization/ui/components/custom_button.dart';
import 'package:flutter_authorization/authorization/ui/components/custom_text_field.dart';
import 'package:flutter_authorization/authorization/ui/tabs/auth_social_services_switch.dart';
import 'package:flutter_authorization/resources/app_colors.dart';
import 'package:flutter_authorization/resources/app_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {

  Map<SignUpElements, dynamic> elementsData;
  Map<SignUpElements, String> elementsErrorData;

  static const double horizontalPadding = 20;


  SignUp(this.elementsData, this.elementsErrorData);

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
          padding: const EdgeInsets.only(top :25),
          child: AuthServicesButtons(),
        ),

          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text("or sign up with email".toUpperCase(),
                style: TextStyle(
                  color: Color(0xFFB3B3B3),
                  fontSize: 14,
                  letterSpacing: 0.55,
                )),
          ),

        Padding(
          padding: const EdgeInsets.only(top : 20),
          child: Row(
            children: [
              Expanded(child: CustomTextField(hintText: "First name",
                  text: elementsData[SignUpElements.FirstName],
                  errorText: elementsErrorData[SignUpElements.FirstName],
                  callbackOnChanged: (value)=>BlocProvider.of<AuthorizationBloc>(context).add(ClickSignUpElementEvent(SignUpElements.FirstName, value))
              )),
              SizedBox(width: 10),
              Expanded(child: CustomTextField(hintText: "Last name",
                  text: elementsData[SignUpElements.LastName],
                  errorText: elementsErrorData[SignUpElements.LastName],
                  callbackOnChanged: (value)=>BlocProvider.of<AuthorizationBloc>(context).add(ClickSignUpElementEvent(SignUpElements.LastName, value))
              )),
            ],
          ),
        ),


        Padding(
          padding: const EdgeInsets.only(top : 20),
          child: CustomTextField(hintText: "Email",
              text: elementsData[SignUpElements.Email],
              errorText: elementsErrorData[SignUpElements.Email],
              callbackOnChanged: (value)=>BlocProvider.of<AuthorizationBloc>(context).add(ClickSignUpElementEvent(SignUpElements.Email, value))
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top : 40),
          child: CustomTextField( hintText: "Password",
              text: elementsData[SignUpElements.Password],
              errorText: elementsErrorData[SignUpElements.Password],
              isPasswordField: true,
              callbackOnChanged: (value)=>BlocProvider.of<AuthorizationBloc>(context).add(ClickSignUpElementEvent(SignUpElements.Password, value))
          ),
        ),

        Padding(padding: EdgeInsets.only(top : 30),
        child: CustomButton(text: "create your account", callbackOnPressed: () => BlocProvider.of<AuthorizationBloc>(context).add(SubmitSignUpEvent()))),

        Padding(
          padding: EdgeInsets.only(top: 40),
          child:RichText(
            text: TextSpan(
                text: "By signing up, you agree to our Terms, Data Policy and\n Cookies Policy. Read our ",
              style: TextStyle(color: Colors.black),
              children: [ TextSpan(text: "privacy policy", style: TextStyle(color: Colors.blueAccent))],
            ),
            textAlign: TextAlign.center,
          )
        ),



        ],
   ),

    );
  }

}
