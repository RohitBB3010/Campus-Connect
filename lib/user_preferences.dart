import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const userLoginType = "isStudent";
  static const committeeCode = "code";

  Future<void> saveUserType(bool isStudent) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(userLoginType, isStudent);
  }

  Future<bool> getUserType() async {
    final prefs = await SharedPreferences.getInstance();
    bool isStudent = prefs.get(userLoginType) as bool;
    return isStudent;
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
