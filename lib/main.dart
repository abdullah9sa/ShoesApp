import 'package:flutter/material.dart';
import 'package:abdullah/themes/themes.dart';
import 'package:abdullah/routes.dart';
import 'package:abdullah/ui/orderPage.dart';

// Main Project File

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Abdullah App',
      theme: AppThemeData.them1(true),
      initialRoute: 'intro',
      routes: routes,
    );
  }
}
