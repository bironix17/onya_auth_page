import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_authorization/resources/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Function callbackOnPressed;
  final String text;

  CustomButton({@required this.callbackOnPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 16),
          child:
              Text(text.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 13)),
        ),
        color: AppColors.primary,
        splashColor: AppColors.primary,
        elevation: 0,
        focusColor: AppColors.primary,
        disabledColor: AppColors.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50), side: BorderSide.none),
        onPressed: callbackOnPressed);
  }
}
