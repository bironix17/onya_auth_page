import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_authorization/resources/app_colors.dart';
import 'package:flutter_authorization/resources/app_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final Function(String) callbackOnChanged;
  // это поля должны быть final, т.к. не будут изменяться

  // поля, подверженные изменениям, должны лежать в классе state соответствующего виджета
  String text;
  String errorText;
  bool isPasswordField;

  CustomTextField(
      {this.hintText,
      this.callbackOnChanged,
      this.text = "",
      this.errorText = null,
      this.isPasswordField = false});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController _controller;
  bool isShowPassword = true;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.text);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        SizedBox(
          child: TextField(
            controller: _controller,
            onChanged: widget.callbackOnChanged,
            obscureText: !isShowPassword,
            decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(color: AppColors.textGhost2, fontSize: 14),
                // я так понимаю, ты решил отключить все дефолтные декораторы
                // уместнее было бы вынести их отдельно и проставить одно значение вместо копипасты
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.onBackgroundGray)),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.backgroundGrayAccent)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.backgroundGrayAccent)),
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.white,
                suffixIcon: widget.isPasswordField
                    ? IconButton(
                        icon: Icon(
                            isShowPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.primary),
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                      )
                    : null),
          ),
        ),
        if (widget.errorText != null && widget.errorText != "")
          Positioned(
            left: 0,
            bottom: -15,
            child: Row(
              children: [
                Icon(
                  Icons.info,
                  color: AppColors.primary,
                  size: 15,
                ),
                SizedBox(width: 4),
                Text(
                  widget.errorText,
                  style: AppFonts.sfUiDisplayBold
                      .copyWith(color: AppColors.primary, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
      ],
    );
  }
}
