import 'package:crypto_app/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/home_page.dart';

void main() async{
  Injector.configure(Flavor.PROD);
  runApp(new MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.pink
      ),
      home: new HomePage(),
    );
  }
}


