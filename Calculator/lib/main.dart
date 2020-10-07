import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator App",
      theme: new ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
      ),
      home: new HomePage(),
    );
  }
}
