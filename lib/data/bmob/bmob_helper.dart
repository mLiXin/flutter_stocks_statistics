import 'package:data_plugin/bmob/bmob.dart';

class BmobHelper {
  static const String apiId = "d7392e6a5c128aa009380c4c4a6ffec5";
  static const String apiKey = "ebe9d8d668c87f0b425f9dd604163d3d";
  static const String masterKey = "388afd3a164092999096744dfe7e0263";

  static void init() {
    Bmob.initMasterKey(apiId, apiKey, masterKey);
  }
}
