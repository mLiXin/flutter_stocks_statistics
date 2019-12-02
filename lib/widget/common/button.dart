import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/constant/color.dart';

class StrokeCornerBtn extends StatelessWidget {
  final String btnStr;
  final double height;
  final double width;
  final Color strokeColor;
  final Color textColor;
  final double textSize;
  final GestureTapCallback onPressed;

  StrokeCornerBtn(this.btnStr,
      {this.onPressed,
      this.height = 30,
      this.width,
      this.strokeColor = Molor.btn_background_blue,
      this.textColor = Molor.btn_text_blue,
      this.textSize = 15});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Molor.btn_background_white,
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: new Border.all(width: 1.0, color: strokeColor),
          ),
          child: Text(
            this.btnStr,
            style: TextStyle(color: textColor, fontSize: textSize),
          ),
        ),
      ),
    );
  }
}

class FillCornerBtn extends StatelessWidget {
  final String btnStr;
  final bool isEnable;
  final GestureTapCallback onPressed;

  FillCornerBtn(this.btnStr, {this.onPressed, this.isEnable = true});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: isEnable ? Molor.btn_background_blue : Molor.btn_background_gray,
        child: Container(
          height: 44,
          width: 300,
          alignment: Alignment.center,
          child: Container(
            width: 300,
            height: 44,
            alignment: Alignment.center,
            child: Text(
              btnStr,
              style: TextStyle(color: Molor.btn_text_white, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
