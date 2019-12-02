import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/data/api/user_api.dart';
import 'package:flutter_stocks_statistics/util/toast_helper.dart';
import 'package:flutter_stocks_statistics/widget/common/appbar.dart';
import 'package:flutter_stocks_statistics/widget/common/button.dart';
import 'package:flutter_stocks_statistics/widget/common/input_item.dart';
import 'package:flutter_stocks_statistics/widget/common/title_page.dart';

class UserRegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserRegisterPage();
}

class _UserRegisterPage extends State<UserRegisterPage> {
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
      title: CommonAppBar("注册"),
      body: Column(
        children: <Widget>[
          CommonInputItem("手机号", _mobileController),
          CommonInputItem("密码", _passwordController),
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 20),
              child: FillCornerBtn(
                "注册",
                onPressed: () {
                  if (_mobileController.text.isEmpty) {
                    ToastHelper.showErrorToast("手机号不能为空");
                    return;
                  }

                  if (_passwordController.text.isEmpty) {
                    ToastHelper.showErrorToast("密码不能为空");
                    return;
                  }
                  UserApi.register(
                          _mobileController.text, _passwordController.text)
                      .then((success) {
                    if (success) {
                      Navigator.pop(context);
                    } else {
                      ToastHelper.showErrorToast("注册失败");
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
