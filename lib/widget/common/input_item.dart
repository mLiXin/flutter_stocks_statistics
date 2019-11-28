import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stocks_statistics/constant/color.dart';

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
  final String tips;

  CommonInputItem(this.tips, this.controller,
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
      height: 88,
      color: Molor.background_white,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 12, right: 12, top: 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  tips,
                  style: TextStyle(color: Molor.text_gray, fontSize: 15),
                )),
          ),
          Container(
            height: 40,
            decoration: new BoxDecoration(
              color: Molor.background_white,
              border: Border.all(width: 2, color: Molor.border_gray),
              borderRadius: BorderRadius.circular(5.0),
            ),
            margin: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 5),
            alignment: Alignment.centerLeft,
            padding: padding == null
                ? EdgeInsets.only(left: 15, right: 15)
                : padding,
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
          ),
        ],
      ),
    );
  }
}
