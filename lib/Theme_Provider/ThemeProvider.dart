import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChange extends  ChangeNotifier
{
  bool isDark = false;
  late SharedPreferences sharedPreferences;


  Future<void> setPreferences(bool value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('theme', value);
  }

  ThemeChange(bool theme){
    isDark = theme;
    notifyListeners();
  }

  Future<void> getTheme()
  async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getBool('theme') ?? false;
    notifyListeners();

  }
  void Theme()
  {
    isDark = !isDark;
    setPreferences(isDark);
    notifyListeners();
  }
}
