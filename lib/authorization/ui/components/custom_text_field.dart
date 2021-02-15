import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_authorization/resources/app_colors.dart';
import 'package:flutter_authorization/resources/app_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final Function(String) callbackOnChanged;
        TextEditingController controller;
  final String errorText;
  final bool isPasswordField;
  final TextInputType textInputType;
        TextInputFormatter formatter;

  CustomTextField(
      {this.hintText,
      this.textInputType = TextInputType.text,
      this.formatter,
      this.callbackOnChanged,
      this.errorText,
      this.isPasswordField = false,
      this.controller,
      String text}){
      if (controller == null ) controller = TextEditingController();
      if (text != null)controller.text = text;
      if (formatter == null)formatter = FilteringTextInputFormatter.allow(RegExp(r'.'));
  }
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}



class _CustomTextFieldState extends State<CustomTextField> {

  static const border =  OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.backgroundGrayAccent));

  bool _showText = false;

  @override
  void initState() {
    _showText = !widget.isPasswordField;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        SizedBox(
          child: TextField(
            keyboardType: widget.textInputType,
            controller: widget.controller,
            onChanged: widget.callbackOnChanged,
            inputFormatters: [
              widget.formatter,
              if (widget.isPasswordField) FilteringTextInputFormatter.deny(' '),
            ],
            obscureText: !_showText,
            decoration: InputDecoration(
                hintText: widget.hintText,
                border: border,
                enabledBorder: border,
                focusedBorder: border,
                focusedErrorBorder: border,
                errorBorder: border,
                disabledBorder: border,
                filled: true,
                hintStyle: AppFonts.sfUiDisplayRegular.copyWith(color: Color(0x7F444444), fontSize: 14),
                fillColor: Colors.white,
                focusColor: Colors.white,
                suffixIcon: widget.isPasswordField
                    ? IconButton(
                        icon: Icon(
                            _showText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.primary,size: 20),
                        onPressed: () {
                          setState(() {
                            _showText = !_showText;
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
