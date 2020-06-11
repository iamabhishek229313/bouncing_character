import 'package:bouncing_character_example/home_page.dart';
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
      home: HomePage()
    );
  }
}

