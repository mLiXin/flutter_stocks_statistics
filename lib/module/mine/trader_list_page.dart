import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/data/database/trader_info_helper.dart';
import 'package:flutter_stocks_statistics/util/navigator_helper.dart';
import 'package:flutter_stocks_statistics/widget/common/appbar.dart';

class TraderListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TraderListPageState();
}

class _TraderListPageState extends State<TraderListPage>{

  @override
  void initState() {
    // TODO: implement initState
    _getAllInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CommonAppBar("券商"),
      body: Text("券商"),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          NavigatorHelper.enterTraderModify(context, null);
        },
      ),
    );
  }

  Future _getAllInfo() async{
    TraderInfoHelper.getTraderInfoList();
  }

}