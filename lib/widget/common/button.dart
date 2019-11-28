import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/constant/color.dart';

class StrokeCornerBtn extends StatelessWidget {
  final String btnStr;
  final double height;
  final double width;
  final Color strokeColor;
  final Color textColor;
  final double textSize;

  StrokeCornerBtn(this.btnStr,
      {this.height = 30,
        this.width,
        this.strokeColor = Molor.btn_background_blue,
        this.textColor = Molor.btn_text_blue,
        this.textSize = 15});

  @override
  Widget build(BuildContext context) {
    return new Material(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      color: Molor.btn_background_white,
      child: new Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: new Border.all(width: 1.0, color: strokeColor),
        ),
        child: new Text(
          this.btnStr,
          style: new TextStyle(color: textColor, fontSize: textSize),
        ),
      ),
    );
  }
}

class FillCornerBtn extends StatefulWidget {
  final String btnStr;
  final bool isEnable;

  FillCornerBtn(this.btnStr, {this.isEnable = true});

  @override
  State<StatefulWidget> createState() => new _FillCornerBtnState();
}

class _FillCornerBtnState extends State<FillCornerBtn> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      color: widget.isEnable
          ? Molor.btn_background_blue
          : Molor.btn_background_gray,
      child: new Container(
        height: 44,
        width: 300,
        alignment: Alignment.center,
        child: new Container(
          width: 300,
          height: 44,
          alignment: Alignment.center,
          child: new Text(
            widget.btnStr,
            style: new TextStyle(color: Molor.btn_text_white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
