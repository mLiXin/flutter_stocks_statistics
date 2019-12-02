import 'package:data_plugin/bmob/table/bmob_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/constant/color.dart';
import 'package:flutter_stocks_statistics/data/constant/routes_map.dart';
import 'package:flutter_stocks_statistics/widget/common/appbar.dart';
import 'package:flutter_stocks_statistics/widget/common/button.dart';
import 'package:flutter_stocks_statistics/widget/common/input_item.dart';
import 'package:flutter_stocks_statistics/widget/common/item.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  bool _isLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    _getLoginInfo();
    super.initState();
  }

  void _getLoginInfo() async {
    BmobUser user = BmobUser();
    _isLogin = (user.objectId != null);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CommonAppBar("我的"),
      body: Column(
        children: <Widget>[
          Container(
            height: 80,
            child: Center(
              child: FillCornerBtn(
                _isLogin ? "已登录" : "去登录",
                onPressed: () {
                  Navigator.of(context).pushNamed(RoutesHelper.user_login);
                },
              ),
            ),
          ),
          GestureDetector(
            child: CommonItem("券商"),
            onTap: () {
              Navigator.of(context).pushNamed(RoutesHelper.trader_list);
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
          Navigator.of(context).pushNamed(RoutesHelper.user_register);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
