import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primarySwatch: Colors.teal),
      home: new MyHomePage(),
    ));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  double age  = 0.0;
  var selectedYear;
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this,duration: new Duration(milliseconds: 1500));
    animation = animationController;
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void _showPicker() {
    showDatePicker(
        context: context,
        initialDate: new DateTime(2020),
        firstDate: new DateTime(1900),
        lastDate: DateTime.now()
    ).then((DateTime dt) {
      setState(() {
        selectedYear = dt.year;
        calculateAge();
      });
    });
  }

  void calculateAge(){
   setState(() {
     age = (2020 - selectedYear).toDouble();
     animation = new Tween<double>(
       begin: animation.value,
       end: age
     ).animate(new CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));
     animation.addListener((){
       setState(() {});
     });
     animationController.forward();
   });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Age Calculator"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new OutlineButton(
                child: new Text(selectedYear != null ? selectedYear.toString():"Select your year of birth"),
                onPressed: _showPicker,
                borderSide: new BorderSide(color: Colors.black, width: 3.0),
                color: Colors.white,
              ),
              new Padding(
                padding: const EdgeInsets.all(20.0),
              ),
              new Text("Your age is ${animation.value.toStringAsFixed(0)}",
                style: new TextStyle(fontSize: 30, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
              )
            ],
          ),
        ),
      ),
    );
  }
}
