import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/widget/common/appbar.dart';
import 'package:flutter_stocks_statistics/widget/common/input_item.dart';
import 'package:flutter_stocks_statistics/widget/common/title_page.dart';

class UserLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  TextEditingController _mobileController;
  TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    _mobileController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _mobileController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CommonTitlePage(
      title: CommonAppBar("登录"),
      body: Column(
        children: <Widget>[
          CommonInputItem("手机号", _mobileController),
          CommonInputItem("密码", _passwordController),
        ],
      ),
    );
  }
}
