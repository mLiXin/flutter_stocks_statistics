import 'package:flutter_stocks_statistics/data/entity/trader_info.dart';
import 'package:flutter_stocks_statistics/util/database_helper.dart';
import 'package:flutter_stocks_statistics/util/log_helper.dart';

class TraderInfoHelper {
  /// 获取全部列表
  static Future<List<TraderInfo>> getTraderInfoList() async {
    var db = await DatabaseHelper().db;
    List<Map> maps = await db.query(tableTrader, columns: [
      columnTraderName,
    ]);

    print(maps);
    if (maps == null || maps.length == 0) {
      return null;
    }

    List<TraderInfo> traderList = [];
    for (int i = 0; i < maps.length; i++) {
      traderList.add(TraderInfo.fromMap(maps[i]));
    }

    LogHelper.e("getTraderInfoList == $traderList");
    return traderList;
  }

  /// 新增券商信息
  static Future<bool> addTrader(TraderInfo traderInfo) async {
    var db = await DatabaseHelper().db;
    traderInfo.id = await db.insert(tableTrader, traderInfo.toMap());
    LogHelper.e("addTrader Success and traderInfo.id = ${traderInfo.id}");
    return traderInfo.id != null;
  }
}
