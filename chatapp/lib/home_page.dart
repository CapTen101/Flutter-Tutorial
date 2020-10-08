import 'package:flutter/material.dart';
import 'chat_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Frenzy Chat"),
        ),
        backgroundColor: Colors.teal,
      ),
      body: ChatScreen(),
    );
  }
}
