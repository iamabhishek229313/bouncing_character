import 'package:bouncing_character/bouncing_character.dart';
import 'package:flutter/material.dart';

// Initializing some custom attributes .

const BgColor = Color.fromRGBO(27, 26, 31, 1.0);
const TextStyle customStyle = TextStyle(fontSize: 44.0, fontFamily: 'BioRhyme', color: Colors.grey);
const Duration customDuration = Duration(milliseconds: 200);
Matrix4 customTransform = Matrix4.identity()..translate(0, -10, 0);


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BgColor,
        body: Center(
            child: BouncingCharacter(
              text: "I'm a developer",
              duration: customDuration,
              style: customStyle,
              onHoverTranslate: customTransform,
            )));
  }
}
