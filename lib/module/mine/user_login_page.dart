import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/data/api/user_api.dart';
import 'package:flutter_stocks_statistics/util/toast_helper.dart';
import 'package:flutter_stocks_statistics/widget/common/appbar.dart';
import 'package:flutter_stocks_statistics/widget/common/button.dart';
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
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 20),
              child: FillCornerBtn(
                "登录",
                onPressed: () {
                  if (_mobileController.text.isEmpty) {
                    ToastHelper.showErrorToast("请输入手机号");
                    return;
                  }

                  if (_passwordController.text.isEmpty) {
                    ToastHelper.showErrorToast("请输入密码");
                    return;
                  }
                  UserApi.login(
                          _mobileController.text, _passwordController.text)
                      .then((success) {
                    if (success) {
                      Navigator.pop(context);
                    } else {
                      ToastHelper.showErrorToast("登录失败");
                    }
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
