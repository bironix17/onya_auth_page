import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_authorization/resources/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthServicesButtons extends StatelessWidget {

  static const double spaceBetweenButtons = 12;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        _buildAuthServiceButton(imagePath: "f"),
        SizedBox(width: spaceBetweenButtons),
        _buildAuthServiceButton(imagePath: "g"),
          SizedBox(width: spaceBetweenButtons),
        _buildAuthServiceButton(imagePath: "in"),
          SizedBox(width: spaceBetweenButtons),
        _buildAuthServiceButton(imagePath: "i"),
      ],),
    );
  }

  Widget _buildAuthServiceButton({@required String imagePath, Function callback = null}){

    return SizedBox(
      width: 42,      // TODO кастыль, кнопка имеет непонятные оступы по бокам
      child: MaterialButton(onPressed: callback,
        padding: EdgeInsets.zero,
        //color: Colors.white,

        child : Container(
            padding: EdgeInsets.all(13),
            child: Text(imagePath, style: TextStyle(color: AppColors.primary),),
        ),

        shape: CircleBorder( side: BorderSide(color: AppColors.primary, width: 2)),
      ),
    );

  }
}
