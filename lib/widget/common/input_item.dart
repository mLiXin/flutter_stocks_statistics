import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final Color inputBackgroundWhite = Color(0xFFFFFFFF);
final Color inputTextBlack = Color(0xFF1B2944);
final Color textGrey = Color(0xFF999999);

class CommonInputItem extends StatelessWidget {
  final bool isPassword;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final TextEditingController controller;
  final String hintText;
  final bool enabled;
  final int maxLength;
  final ValueChanged<String> onChange;

  CommonInputItem(this.controller,
      {this.hintText,
      this.margin,
      this.padding,
      this.isPassword = false,
      this.enabled = true,
      this.maxLength = 10000,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: margin,
      alignment: Alignment.centerLeft,
      color: inputBackgroundWhite,
      height: 44,
      padding: padding == null ? EdgeInsets.only(left: 15, right: 15) : padding,
      child: new TextField(
        controller: controller,
        inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
        enabled: enabled,
        style: TextStyle(fontSize: 15, color: inputTextBlack),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 15, color: textGrey)),
        cursorColor: inputTextBlack,
        obscureText: isPassword,
        onChanged: onChange,
      ),
    );
  }
}
