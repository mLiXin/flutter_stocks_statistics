import 'package:shared_preferences/shared_preferences.dart';

const String objectIdKey = "objectId";

class UserPref{
  static Future setObjectId(String objectId) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(objectIdKey, objectId);
  }

  static Future<String> getObjectId() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(objectIdKey);
  }
}