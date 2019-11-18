import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/widget/common/appbar.dart';

class TraderModifyPage extends StatelessWidget {
  final int traderId;
  TraderModifyPage({this.traderId});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CommonAppBar("修改"),
      body: Text("修改券商"),
    );
  }
}
