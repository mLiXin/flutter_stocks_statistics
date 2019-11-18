import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/module/home/home_page.dart';
import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;

void main(){
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stocks Statistics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}