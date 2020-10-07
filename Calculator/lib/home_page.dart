import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var sum = 0, num1 = 0, num2 = 0;

  // To provide default values to the variables
  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();

  void Add() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);

      sum = num1 + num2;
    });
  }

  void Subtract() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);

      sum = num1 - num2;
    });
  }

  void Multiply() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);

      sum = num1 * num2;
    });
  }

  void Divide() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);

      sum = num1 ~/ num2;
    });
  }

  void Clear() {
    setState(() {
      t1.text = "0";
      t2.text = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("My Custom Calculator"),
      ),
      body: new Container(
          padding: EdgeInsets.all(40),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Output: $sum",
                style: new TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              new TextField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  hintText: "Enter Number",
                ),
                controller: t1,
              ),
              new TextField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  hintText: "Enter Number",
                ),
                controller: t2,
              ),
              new Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new MaterialButton(
                    color: Colors.greenAccent,
                    onPressed: Add,
                    child: new Text(
                      "+",
                      style: new TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  new MaterialButton(
                    color: Colors.greenAccent,
                    onPressed: Subtract,
                    child: new Text(
                      "-",
                      style: new TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new MaterialButton(
                    color: Colors.greenAccent,
                    onPressed: Multiply,
                    child: new Text(
                      "*",
                      style: new TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  new MaterialButton(
                    color: Colors.greenAccent,
                    onPressed: Divide,
                    child: new Text(
                      "/",
                      style: new TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              new MaterialButton(
                onPressed: Clear,
                child: new Text(
                  "Clear",
                ),
                color: Colors.greenAccent,
              )
            ],
          )),
    );
  }
}

