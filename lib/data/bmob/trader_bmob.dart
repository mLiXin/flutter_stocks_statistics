import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_saved.dart';
import 'package:flutter_stocks_statistics/data/entity/trader_info.dart';
import 'package:flutter_stocks_statistics/data/pref/user_pref.dart';
import 'package:flutter_stocks_statistics/util/database_helper.dart';

class TraderBmob {
  static Future<bool> addTrader(TraderInfo traderInfo) async {
    String objectId = await UserPref.getObjectId();
    traderInfo.userObjectId = objectId;
    BmobSaved bmobSaved = await traderInfo.save();

    return bmobSaved.objectId == null;
  }

  static Future<List<TraderInfo>> getTraderList() async {
    BmobQuery query = BmobQuery();
    String userObjectId = await UserPref.getObjectId();
    query.addWhereEqualTo(columnTraderUserId, userObjectId);

    var data = await query.queryObjects();

    List<TraderInfo> result = data.map((i) => TraderInfo.fromMap(i)).toList();

    return result;
  }
}
