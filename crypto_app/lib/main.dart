import 'package:flutter/material.dart';
import 'package:crypto_app/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async{
  List currencies = await getCurrencies();
  print(currencies);
  runApp(new MyApp(currencies));
}


class MyApp extends StatelessWidget {
  final List _currencies;
  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.pink
      ),
      home: new HomePage(_currencies),
    );
  }
}


Future<List> getCurrencies() async {
  String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  var response =  await http.get(cryptoUrl);
  return json.decode(response.body); //List

}
