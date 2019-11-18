import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/widget/common/appbar.dart';

class StatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CommonAppBar("统计"),
      body: Text("StatisticsPage"),
    );
  }
}
