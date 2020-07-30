import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded BuildKey(int num, Color color) {
    return (Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(num);
        },
        child: Text('Click Me! 1'),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            BuildKey(1, Colors.red),
            BuildKey(2, Colors.orange),
            BuildKey(3, Colors.yellow),
            BuildKey(4, Colors.green),
            BuildKey(5, Colors.teal),
            BuildKey(6, Colors.blue),
            BuildKey(7, Colors.purple),
          ],
        )),
      ),
    );
  }
}
