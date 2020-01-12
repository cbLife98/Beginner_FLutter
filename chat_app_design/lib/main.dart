import 'package:flutter/material.dart';
import 'package:chat_app_design/home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Chat App",
      theme: new ThemeData(primarySwatch: Colors.red),
      home: new HomePage()
    );
  }
}
