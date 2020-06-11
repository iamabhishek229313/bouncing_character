library "bouncing_character" ;

import 'package:flutter/material.dart';

class BouncingCharacter extends StatefulWidget {
  final String text ;
  final TextStyle style ;
  final Duration duration ;
  final Matrix4 onHoverTranslate ;
  const BouncingCharacter({Key key,@required this.text , @required this.duration , this.style , this.onHoverTranslate}) : assert(
  text != null && duration != null
  ) ;

  @override
  _BouncingCharacterState createState() => _BouncingCharacterState();
}

class _BouncingCharacterState extends State<BouncingCharacter> {
  @override
  Widget build(BuildContext context) {
    List<String> words = widget.text.split(' ') ;
    print(words) ;
    return Wrap(
        runAlignment: WrapAlignment.center,
        children: words.map((e) => EachString(
          text: e,
          style: widget.style,
        ))
            .toList());
  }
}

class EachString extends StatefulWidget {
  String text;
  final TextStyle style ;
  final Duration duration ;
  EachString({Key key, @required this.text ,@required this.style ,@required this.duration}) : super(key: key);

  @override
  _EachStringState createState() => _EachStringState();
}

class _EachStringState extends State<EachString> {
  @override
  Widget build(BuildContext context) {
    widget.text = " " + widget.text ;
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          widget.text.length,
              (index) => TransalteContainer(
            duration: widget.duration,
            child: Text(
              widget.text[index],
              style: widget.style == null ? null : widget.style,
            ),
          ),
        ));
  }
}

class TransalteContainer extends StatefulWidget {
  final Widget child;
  final Duration duration ;
  const TransalteContainer({Key key, @required this.child ,@required this.duration}) : super(key: key);

  @override
  _TransalteContainerState createState() => _TransalteContainerState();
}

class _TransalteContainerState extends State<TransalteContainer> {
  final onHoverTranslate = Matrix4.identity()..translate(0, -10, 0);
  final onNonHoverTranslate = Matrix4.identity()..translate(0, 0, 0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (e) => _mouseEnter(true),
        onExit: (e) => _mouseEnter(false),
        child: AnimatedContainer(
          duration: widget.duration,
          child: widget.child,
          transform: _hovering ? onHoverTranslate : onNonHoverTranslate,
        ));
  }

  _mouseEnter(bool val) {
    setState(() {
      _hovering = val;
    });
  }
}
