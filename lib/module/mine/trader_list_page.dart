import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/data/model/trader_model.dart';
import 'package:flutter_stocks_statistics/util/log_helper.dart';
import 'package:flutter_stocks_statistics/util/navigator_helper.dart';
import 'package:flutter_stocks_statistics/widget/common/appbar.dart';
import 'package:flutter_stocks_statistics/widget/common/title_page.dart';
import 'package:provider/provider.dart';

class TraderListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TraderListPageState();
}

class _TraderListPageState extends State<TraderListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => TraderModel()),
      ],
      child: Consumer<TraderModel>(
        builder: (context, trader, _) {
          return CommonTitlePage(
            title: CommonAppBar("券商"),
            body: ListView.builder(
                itemCount:
                    trader.traderList == null ? 0 : trader.traderList.length,
                itemExtent: 50.0, //强制高度为50.0
                itemBuilder: (BuildContext context, int index) {
                  LogHelper.e("index = $index");
                  return Column(
                    children: <Widget>[
                      Expanded(
                          child: Center(
                              child: Text("${trader.traderList[index].name}"))),
                      Divider(
                        height: 0.2,
                        color: Colors.grey,
                      ),
                    ],
                  );
                }),
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
        },
      ),
    );
  }
}
