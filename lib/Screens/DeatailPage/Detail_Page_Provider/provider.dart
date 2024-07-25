import 'package:flutter/material.dart';

class DetailPageProvider extends ChangeNotifier
{
  var index = 0;
  List favoriteList = [];
  bool fav = false;

  void setData()
  {
    fav = !fav;
    notifyListeners();
  }



}