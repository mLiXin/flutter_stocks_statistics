import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/module/home/statistics_page.dart';

import 'account_page.dart';
import 'hold_page.dart';
import 'mine_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _list = new List();

  @override
  void initState() {
    _list
      ..add(AccountPage())
      ..add(HoldPage())
      ..add(StatisticsPage())
      ..add(MinePage());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.supervisor_account,
                color: Colors.blue,
              ),
              title: Text("账户")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.work,
                color: Colors.blue,
              ),
              title: Text("持仓")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.assessment,
                color: Colors.blue,
              ),
              title: Text("统计")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.mood,
                color: Colors.blue,
              ),
              title: Text("我的")),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting,
      ),
      body:_list[_currentIndex],
    );
  }
}
