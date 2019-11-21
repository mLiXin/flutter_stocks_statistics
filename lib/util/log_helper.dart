class LogHelper {
  static bool isLog = true;

  static void e(Object message) {
    if (isLog) {
      print("LogHelper:" + message);
    }
  }
}
