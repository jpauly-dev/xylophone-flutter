import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MusicNote(1, "DO", Colors.red),
              MusicNote(2, "RE", Colors.orange),
              MusicNote(3, "MI", Colors.yellow),
              MusicNote(4, "FA", Colors.green),
              MusicNote(5, "SOL", Colors.teal),
              MusicNote(6, "LA", Colors.blue),
              MusicNote(7, "SI", Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}

class MusicNote extends StatelessWidget {
  final int noteNumber;
  final String name;
  final Color color;

  const MusicNote(
    this.noteNumber,
    this.name,
    this.color, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();

    return Expanded(
      child: MaterialButton(
        onPressed: () {
          player.play(DeviceFileSource('assets/note$noteNumber.wav'));
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          color: color,
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
