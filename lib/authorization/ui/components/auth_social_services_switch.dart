import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_authorization/resources/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/app_colors.dart';

class AuthServicesButtons extends StatelessWidget {
  static const double _spaceBetweenButtons = 3;

  final Function() facebookCallBack;
  final Function() googleCallBack;
  final Function() linkedinCallBack;
  final Function() instagramCallBack;

  AuthServicesButtons({
      this.facebookCallBack,
      this.googleCallBack,
      this.linkedinCallBack,
      this.instagramCallBack});

  @override
  Widget build(BuildContext context, ) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildAuthServiceButton(child: _buildLogoForButton(assetPath : "assets/icons/facebook_logo.svg"), callback: facebookCallBack),
          SizedBox(width: _spaceBetweenButtons),
          _buildAuthServiceButton(child: _buildLogoForButton(assetPath :  "assets/icons/google_logo.svg", size: 16), callback: googleCallBack),
          SizedBox(width: _spaceBetweenButtons),
          _buildAuthServiceButton(child: _buildLogoForButton(assetPath :  "assets/icons/linkedin_logo.svg"), callback: linkedinCallBack),
          SizedBox(width: _spaceBetweenButtons),
          _buildAuthServiceButton(child: _buildLogoForButton(assetPath :  "assets/icons/instagram_logo.svg"), callback: instagramCallBack),
        ],
      ),
    );
  }

  _buildLogoForButton({String assetPath, double size = 15}){
    return SvgPicture.asset(assetPath, height: size, color: AppColors.primary);
  }

  Widget _buildAuthServiceButton({@required Widget child, Function callback}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: callback,
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(42),
            color: Colors.transparent,
            border: Border.all(
              color: AppColors.primary,
              width: 2,
            ),
          ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
