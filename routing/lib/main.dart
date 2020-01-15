import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:routing/new_page.dart';

void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: defaultTargetPlatform == TargetPlatform.android ? Colors.grey[50] : null
      ),
      home: new HomePage(),
      routes: <String,WidgetBuilder>{
    "/a":(BuildContext context) => new NewPage("New PAge"),
  }
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Drawer App"),
        elevation: defaultTargetPlatform == TargetPlatform.android?5.0:0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Isha Agarwal"),
                accountEmail: new Text("Ishagar98@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white70,
                child: new Text("P"),
              ),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                  backgroundColor: Colors.white70,
                  child: new Text("K"),
                ),
              ],
            ),
            new ListTile(
              title: new Text("Page One"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("\a");
              } ,

            ),
            new ListTile(
              title: new Text("Page Two"),
              trailing: new Icon(Icons.arrow_downward),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => NewPage("Page One"))),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
              onTap:  () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: new Container(
        child: new Center(
          child: new Text("Home Page"),
        ),
      ),
    );
  }
}
