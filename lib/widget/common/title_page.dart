import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/constant/color.dart';

class CommonTitlePage extends StatelessWidget {
  final Widget title;
  final Widget body;
  final FloatingActionButton floatingActionButton;

  CommonTitlePage(
      {@required this.title, @required this.body, this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Molor.background_gray,
      appBar: title,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
