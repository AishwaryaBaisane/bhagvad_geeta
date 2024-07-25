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
