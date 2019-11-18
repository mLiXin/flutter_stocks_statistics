import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/widget/common/appbar.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CommonAppBar("账户"),
      body: Column(
        children: <Widget>[],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
