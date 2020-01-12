import 'package:flutter/material.dart';
import 'package:chat_app_design/chat_screen.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Chat App"),
        centerTitle: true,
      ),
      body: new ChatScreen(),
    );
  }
}
