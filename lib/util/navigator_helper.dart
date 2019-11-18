import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/module/home/home_page.dart';
import 'package:flutter_stocks_statistics/module/mine/trader_list_page.dart';
import 'package:flutter_stocks_statistics/module/mine/trader_modify_page.dart';

class NavigatorHelper {
  ///主页
  static enterHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        (route) => route == null);
  }

  /// 券商列表页
  static enterTraderList(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TraderListPage()));
  }

  /// 券商修改页
  static enterTraderModify(BuildContext context, int traderId) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TraderModifyPage(
                  traderId: traderId,
                )));
  }
}
