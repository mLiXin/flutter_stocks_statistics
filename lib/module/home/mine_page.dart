import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/widget/common/appbar.dart';
class MinePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CommonAppBar("我的"),
      body: Text("MinePage"),);
  }
}