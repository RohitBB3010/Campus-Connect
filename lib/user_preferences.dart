import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const userLoginType = "isStudent";
  static const committeeCode = "code";

  Future<void> saveUserType(bool isStudent) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(userLoginType, isStudent);
  }

  Future<void> getUSerType() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.get(userLoginType);
  }

  Future<void> setCode(String code) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(committeeCode, code);
  }

  Future<void> getCode(String code) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.get(code);
  }
}
