import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  String selectLanguage = 'Sanskrit';

  void setLanguage(String value) {
    selectLanguage = value;
    notifyListeners();
  }
  HomePageProvider()
  {
    setLanguage(selectLanguage);
  }
}