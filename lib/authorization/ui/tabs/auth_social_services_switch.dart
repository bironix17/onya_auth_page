import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_authorization/resources/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/app_colors.dart';

class AuthServicesButtons extends StatelessWidget {
  static const double spaceBetweenButtons = 12;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildAuthServiceButton(imagePath: "f"),
          SizedBox(width: spaceBetweenButtons),
          _buildAuthServiceButton(imagePath: "g"),
          SizedBox(width: spaceBetweenButtons),
          _buildAuthServiceButton(imagePath: "in"),
          SizedBox(width: spaceBetweenButtons),
          _buildAuthServiceButton(imagePath: "i"),
        ],
      ),
    );
  }

  Widget _buildAuthServiceButton(
      // именнованные переменные по умолчанию равны null
      {@required String imagePath,
      Function callback = null}) {
    // как я уже упоминал, у кнопок довольно много side-эффектов, про которые мы часто не знаем
    // поэтому в случае настолько кастомных кнопок, я считаю, уместно написать свою из базовых компонентов
    // пример, написанный на скорую руку, ниже

    // return Padding(
    //   padding: EdgeInsets.symmetric(horizontal: 5),
    //   child: InkWell(
    //     onTap: callback,
    //     child: Container(
    //       width: 42.0,
    //       height: 42.0,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(42),
    //         color: Colors.transparent,
    //         border: Border.all(
    //           color: AppColors.primary,
    //           width: 2,
    //         ),
    //       ),
    //       child: Center(
    //         child: Text(imagePath,
    //             style: TextStyle(
    //               color: AppColors.primary,
    //               fontWeight: FontWeight.bold,
    //               fontSize: 20,
    //             )),
    //       ),
    //     ),
    //   ),
    // );

    return SizedBox(
      width: 42, // TODO кастыль, кнопка имеет непонятные оступы по бокам
      child: MaterialButton(
        onPressed: callback,
        padding: EdgeInsets.zero,
        //color: Colors.white,

        child: Container(
          padding: EdgeInsets.all(13),
          child: Text(
            imagePath,
            style: TextStyle(color: AppColors.primary),
          ),
        ),

        shape:
            CircleBorder(side: BorderSide(color: AppColors.primary, width: 2)),
      ),
    );
  }
}
