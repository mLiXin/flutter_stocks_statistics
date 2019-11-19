import 'package:flutter_stocks_statistics/data/entity/account_info.dart';
import 'package:flutter_stocks_statistics/util/database_helper.dart';

class AccountInfoHelper {
  static Future<List<AccountInfo>> getAllAccount() async {
    var db = await DatabaseHelper().db;
    List<Map> maps = await db.query(tableAccount, columns: [
      columnAccountId,
      columnAccountName,
      columnTraderId,
      columnAccount,
      columnPassword
    ]);

    if (maps == null || maps.length == 0) {
      return null;
    }

    List<AccountInfo> accountList = [];
    for (int i = 0; i < maps.length; i++) {
      accountList.add(AccountInfo.fromMap(maps[i]));
    }

    return accountList;
  }
}
