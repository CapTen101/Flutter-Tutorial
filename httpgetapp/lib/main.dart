import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String URL = "https://jsonplaceholder.typicode.com/todos/1";

  // This list will store all the information coming from the API
  DataObject data;
  Future<DataObject> futureJSON;

  @override
  void initState() {
    super.initState();
    futureJSON = getJsonData();
  }

  Future<DataObject> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(URL),
      headers: {"Accept": "application/json"},
    );

    // this prints the entire json response to the console
    print(response.body.toString());

    DataObject dataObject;

    setState(() {
      var convertDataToJSON = json.decode(response.body);
      dataObject = new DataObject.fromJson(convertDataToJSON);
      data = dataObject;
      print(
          "The userid is ${dataObject.userId.toString()} and title is ${dataObject.title}");
    });

    return dataObject;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP Get"),
      ),
      body: FutureBuilder<DataObject>(
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return Text("Hello!, today we'll study: " + snapshot.data.title);
          else if (snapshot.hasError)
            return Text("Error is : ${snapshot.error}");
          return CircularProgressIndicator();
        },
        future: futureJSON,
      ),
    );
  }
}
