import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main () => runApp(new MaterialApp(
  home: new HomePage(),
));


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final String url = "https://swapi.co/api/people";
  List data;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(
      // Encode the url (if any spaces or error
      Uri.encodeFull(url),
      // we only want json response
      headers: {"Accept" :"application/json"}
    );
    print(response.body);
    setState(() {
      var convertDataToJson  = json.decode(response.body);
      data = convertDataToJson['results'];
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("HTTP JSON"),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0: data.length,
          itemBuilder: (BuildContext context,int index){
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new Container(
                      padding: const EdgeInsets.all(20.0),
                      child: new Text(data[index]['name']),
                    ),
                  )
                ],
              ),
            ),
          );
          }
      ),
    );
  }
}
