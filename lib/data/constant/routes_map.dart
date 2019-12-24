import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/module/mine/trader_list_page.dart';
import 'package:flutter_stocks_statistics/module/mine/trader_modify_page.dart';
import 'package:flutter_stocks_statistics/module/mine/user_login_page.dart';
import 'package:flutter_stocks_statistics/module/mine/user_register_page.dart';

class RoutesHelper {
  static const String home = "/";

  static const String user_login = "user_login";
  static const String user_register = "user_register";

  static const String trader_list = "trader_list";
  static const String trader_modify = "trader_modify";



  static Map<String, WidgetBuilder> routes = {
    user_login: (context) => UserLoginPage(),
    user_register: (context) => UserRegisterPage()
  };

  static Map<String, WidgetBuilder> needLoginRoutes = {
    trader_list: (context) => TraderListPage(),
    trader_modify: (context) => TraderModifyPage(),
  };

}
