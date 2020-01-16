import 'package:flutter/material.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  final routes = {
    '/login': (BuildContext context) => new LoginPage(),
    '/home' : (BuildContext context) => new HomePage(),
    '/': (BuildContext context) => new LoginPage()
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sqflite',
      theme: new ThemeData(primarySwatch: Colors.teal),
      routes: routes,
    );
  }
}
