import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/data/api/trader_api.dart';
import 'package:flutter_stocks_statistics/data/entity/trader_info.dart';
import 'package:flutter_stocks_statistics/util/navigator_helper.dart';
import 'package:flutter_stocks_statistics/widget/common/appbar.dart';

class TraderListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TraderListPageState();
}

class _TraderListPageState extends State<TraderListPage> {
  List<TraderInfo> _data = [];

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
      body: Text("新增的券商：${_data[0].name}"),
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

  Future _getAllInfo() async {
    _data = await TraderApi.getTraderList();
    setState(() {});
  }
}
