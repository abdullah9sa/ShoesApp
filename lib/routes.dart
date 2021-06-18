import 'package:flutter/material.dart';
import 'package:abdullah/ui/home.dart';
import 'package:abdullah/ui/intro.dart';
import 'package:abdullah/ui/orderPage.dart';
import 'package:abdullah/ui/imagesProvider.dart';

// File to Save and Handle Routes

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => IntroPage(),
  "/home": (BuildContext context) => homePage(),
  "/order": (BuildContext context) => orderPage(),
  // "/order": (BuildContext context) => _anmRoute(),
};
