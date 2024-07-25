// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import '../model/geeta_model.dart';
//
// class GitaProvider extends ChangeNotifier
// {
//   List<GitaModal> gitaModelList = [];
//
//   Future<void> JsonParsing()
//   async {
//     String Json = await rootBundle.loadString('assets/json/geeta.json');
//     List response =jsonDecode(Json);
//     gitaModelList = response.map((e)=>GitaModal.fromJson(e)).toList();
//   }
//
//   GitaProvider()
//   {
//     JsonParsing();
//   }
// }
// //
// // import 'dart:convert';
// //
// // import 'package:bhagwat_geeta/modal/shloks_modal.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// //
// // class GitaProvider extends ChangeNotifier {
// //   List<GitaModal> gitaModalList = [];
// //
// //   Future<void> jsonParsing() async {
// //     String json = await rootBundle.loadString('assets/json/shloks.json');
// //     List response = jsonDecode(json);
// //     gitaModalList = response
// //         .map(
// //           (e) => GitaModal.fromJson(e),
// //     )
// //         .toList();
// //   }
// //
// //   GitaProvider(){
// //     jsonParsing();
// //   }
// // }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/geeta_model.dart';

class GitaProvider extends ChangeNotifier {
  List<GitaModal> gitaModalList = [];

  Future<void> jsonParsing() async {
    String json = await rootBundle.loadString('assets/json/geeta.json');
    List response = jsonDecode(json);
    gitaModalList = response
        .map(
          (e) => GitaModal.fromJson(e),
    )
        .toList();
  }

  GitaProvider(){
    jsonParsing();
  }
}

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

//
//   Future<void> getTheme()
//   async {
//     sharedPreferences = await SharedPreferences.getInstance();
//     sharedPreferences.getBool('theme') ?? false;
//     notifyListeners();
//
//   }
//   void Theme()
//   {
//     isDark = !isDark;
//     setPreferences(isDark);
//     notifyListeners();
//   }
// }