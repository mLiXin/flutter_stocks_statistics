import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/util/navigator_helper.dart';
import 'package:flutter_stocks_statistics/widget/common/appbar.dart';
import 'package:flutter_stocks_statistics/widget/common/item.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CommonAppBar("我的"),
      body: Column(
        children: <Widget>[
          GestureDetector(
            child: CommonItem("券商"),
            onTap: () {
              NavigatorHelper.enterTraderList(context);
            },
          ),
        ],
      ),
    );
  }
}
