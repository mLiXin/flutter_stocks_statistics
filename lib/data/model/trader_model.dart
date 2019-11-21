import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/data/api/trader_api.dart';
import 'package:flutter_stocks_statistics/data/entity/trader_info.dart';

class TraderModel with ChangeNotifier {

  List<TraderInfo> _traderList = new List<TraderInfo>();

  get traderList => _traderList;

  Future getTraderList() async {
    await TraderApi.getTraderList().then((list) {
      _traderList = list;
      notifyListeners();
    });
  }
}
