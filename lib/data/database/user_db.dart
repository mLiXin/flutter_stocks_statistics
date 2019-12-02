import 'package:flutter_stocks_statistics/data/entity/user_info.dart';
import 'package:flutter_stocks_statistics/data/pref/user_pref.dart';
import 'package:flutter_stocks_statistics/util/database_helper.dart';

class UserDb {
  static Future<bool> register(
      String name, String mobile, String password) async {
    var client = await DatabaseHelper().db;

    int id = await client.insert(
        tableUser, UserInfo(mobile, password, userName: name).toMap());

    if (id == null) {
      return false;
    } else {
      return true;
    }
  }

  static Future<bool> login(String mobile, String password) async {
    var client = await DatabaseHelper().db;

    /// 检查是否存在该账号
    List<Map> maps = await client.query(tableUser,
        columns: [columnUserId, columnUserPassword],
        where: '$columnUserMobile = ?',
        whereArgs: [mobile]);

    if (maps.length == 0) {
      return false;
    }

    /// 检查密码是否一致
    for (int i = 0; i < maps.length; i++) {
      if (maps[i][columnUserPassword] == password) {
        await UserPref.setObjectId(maps[i][columnUserId]);
        return true;
      } else {
        return false;
      }
    }
  }
}
