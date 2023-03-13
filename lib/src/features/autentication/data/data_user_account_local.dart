import 'dart:convert';

import 'package:sarang_app/src/features/autentication/domain/user_account.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataUserAccountLocal {
  static const userAccountKey = 'UserAccountKey';

  static getDataUserAccountFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(userAccountKey) ?? '';
    return jsonDecode(result);
  }

  static void setDataAccountToStorage(UserAccount userAccount) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userAccountKey, jsonEncode(userAccount.toMap()));
  }
}

class UserAccountRegister {
  static const String userRegisterAccountKey = 'userAccountRegisterKey';

  static Future<bool> getUserAccountRegister() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userRegisterAccountKey) ?? false;
  }

  static void setUserAccountManager(bool isRegister) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(userRegisterAccountKey, isRegister);
  }

  static void userAccountLogout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userRegisterAccountKey);
  }
}