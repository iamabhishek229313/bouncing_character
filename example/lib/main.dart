import 'package:flutter/material.dart';
import 'package:bouncing_character/bouncing_character.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
         child: BouncingCharacter(text: "I'm a developer", duration: Duration(milliseconds: 200),),
        ),
      ),
    );
  }
}

