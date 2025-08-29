import 'package:shared_preferences/shared_preferences.dart';

class UTISharedPreferences {
  static late final SharedPreferences _caching;
  static SharedPreferences get storage => _caching;

  //===   Khởi tạo  ===
  static Future<void> init() async {
    _caching = await SharedPreferences.getInstance();
  }
}