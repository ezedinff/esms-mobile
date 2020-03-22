import 'package:esms/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Firebase Analytics
      // Named Routes
      home: Home(),

      // Theme
      theme: new ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Raleway'),
    );
  }
}
