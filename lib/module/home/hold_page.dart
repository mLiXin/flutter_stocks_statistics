import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/widget/common/appbar.dart';
class HoldPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CommonAppBar("持仓"),
      body: Text("HoldPage"),);
  }
}