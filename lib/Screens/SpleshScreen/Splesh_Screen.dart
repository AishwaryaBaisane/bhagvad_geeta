import 'dart:async';
import 'package:bhagvad_geeta/Screens/HomePage/view/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpleshScreen extends StatelessWidget {
  const SpleshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/firstPage2.jpg'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            width: width * 0.9,
            decoration: BoxDecoration(color: Colors.black38),
            child: Text(
              ' || श्रीमद् भगवत् गीता ||',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 37,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
