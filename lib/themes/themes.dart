import 'package:flutter/material.dart';

// handles theme data
class AppThemeData {
  static TextStyle mainTextStyle =
      TextStyle(color: Colors.black, fontSize: 22, fontFamily: 'DoHyeon');
  static TextStyle secondStyle =
      TextStyle(color: Colors.black45, fontSize: 18, fontFamily: 'DoHyeon');

  static ThemeData them1(br) {
    return ThemeData(
      primaryColor: Colors.amber,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(bodyText1: mainTextStyle),
    );
  }
}
