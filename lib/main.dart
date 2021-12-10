import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(DevicePreview(builder: (context) => XylophoneApp()));

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            buildKey(note: 1, color: Colors.red),
            buildKey(note: 2, color: Colors.orange),
            buildKey(note: 3, color: Colors.yellow),
            buildKey(note: 4, color: Colors.pink),
            buildKey(note: 5, color: Colors.green),
            buildKey(note: 6, color: Colors.blue),
            buildKey(note: 7, color: Colors.purple),
          ],
        ),
      ),
    );
  }

  void playSound(int note) {
    final player = AudioCache();
    player.play('note$note.wav');
  }

  Widget buildKey({required int note, required Color color}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          playSound(note);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
