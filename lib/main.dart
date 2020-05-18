import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MaterialApp(
      home: XylophoneApp(),
      debugShowCheckedModeBanner: false,
    ));

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              buildKey(colorKey: Colors.red, note:'Do', soundNumber: 1),
              buildKey(colorKey: Colors.orange, note: 'Re', soundNumber: 2),
              buildKey(colorKey: Colors.yellow, note: 'Mi', soundNumber: 3),
              buildKey(colorKey: Colors.green, note: 'Fa', soundNumber: 4),
              buildKey(colorKey: Colors.teal, note: 'Sol', soundNumber: 5),
              buildKey(colorKey: Colors.blue, note: 'La', soundNumber: 6),
              buildKey(colorKey: Colors.purple, note: 'Si', soundNumber: 7),           
            ],
          ),
        ),
      ),
    );
  }

  buildKey({Color colorKey, String note, int soundNumber}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          playSound(soundNumber);
        },
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          fit: StackFit.passthrough,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Container(
              color: colorKey,
            ),
            Transform.rotate(
              angle: pi / 2.0,
              child: Text(
                '$note',
                style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }
}
