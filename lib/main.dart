import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/data/bmob/bmob_helper.dart';
import 'package:flutter_stocks_statistics/module/home/home_page.dart';
import 'package:flutter_stocks_statistics/util/log_helper.dart';

import 'data/constant/routes_map.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    BmobHelper.init();

    return MaterialApp(
      title: 'Flutter Stocks Statistics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: RoutesHelper.routes,
      onGenerateRoute: (RouteSettings settings) {
        LogHelper.e("这里表示通过onGenerateRoute");
        return MaterialPageRoute(
            builder: RoutesHelper.needLoginRoutes[settings.name]);
        // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
        // 引导用户登录；其它情况则正常打开路由。
      },
      home: HomePage(),
    );
  }
}
