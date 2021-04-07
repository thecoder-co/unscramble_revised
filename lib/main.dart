import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/grid.dart';
import 'screens/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        //All available pages
        '/home': (BuildContext context) => Home(),
        '/grid': (BuildContext context) => Grid(),
        '/settings': (BuildContext context) => Settings(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
