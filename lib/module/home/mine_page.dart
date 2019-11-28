import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/constant/color.dart';
import 'package:flutter_stocks_statistics/util/navigator_helper.dart';
import 'package:flutter_stocks_statistics/widget/common/appbar.dart';
import 'package:flutter_stocks_statistics/widget/common/input_item.dart';
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
          Divider(
            height: 0.2,
            color: Molor.divider,
          ),
          Container(
            color: Molor.background_blue,
            child: CommonInputItem("测试用", null),
          ),
          Divider(
            height: 0.2,
            color: Molor.divider,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          NavigatorHelper.enterUserRegister(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
