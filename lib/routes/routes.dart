import 'package:flutter/material.dart';
import '../Screens/DeatailPage/View/detailPage.dart';
import '../Screens/FavoritePage/Favorit_Page.dart';
import '../Screens/HomePage/view/homePage.dart';
import '../Screens/SpleshScreen/Splesh_Screen.dart';

class MyRoutes
{
  static Map<String, Widget Function(BuildContext)> routes = {
    '/' : (context)=> SpleshScreen(),
    '/home' : (context)=> HomePage(),
    '/detail' : (context)=> detailPage(),
    '/fav' : (context)=> FavoritPage(),
  };
}