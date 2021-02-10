import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_authorization/resources/app_colors.dart';

class CustomButton extends StatelessWidget {
  // у stateless виджета поля должны быть final
  Function callbackOnPressed;
  String text;

  CustomButton({@required this.callbackOnPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child:
              Text(text.toUpperCase(), style: TextStyle(color: Colors.white)),
        ),
        color: AppColors.primary,
        splashColor: AppColors.primary,
        // не хватает еще такого свойства, т.к. в макете у кнопок тени не было
        // elevation: 0,
        focusColor: AppColors.primary,
        disabledColor: AppColors.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50), side: BorderSide.none),
        onPressed: callbackOnPressed);
  }
}
