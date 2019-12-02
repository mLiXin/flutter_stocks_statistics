import 'package:flutter_stocks_statistics/data/database/user_db.dart';

class UserApi {
  static Future<bool> register(String mobile, String password) async {
    return await UserDb.register(mobile, mobile, password);
  }

  static Future<bool> login(String mobile, String password) async {
    return await UserDb.login(mobile, password);
  }
}
