library "bouncing_character" ;

import 'package:flutter/material.dart';

class BouncingCharacter extends StatefulWidget {
  final String text ;
  final TextStyle style ;
  final Duration duration ;
  final Matrix4 onHoverTranslate ;
  final WrapAlignment wrapAlignment ;
  const BouncingCharacter({Key key,@required this.text , @required this.duration , this.style , this.onHoverTranslate, this.wrapAlignment}) : assert(
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
        runAlignment: widget.wrapAlignment == null ?  WrapAlignment.center : widget.wrapAlignment,
        children: words.map((e) => EachString(
          text: e,
          style: widget.style,
          duration: widget.duration,
          onHoverTranslate: widget.onHoverTranslate,
        ))
            .toList());
  }
}

class EachString extends StatefulWidget {
  String text;
  final TextStyle style ;
  final Duration duration ;
  final Matrix4 onHoverTranslate ;
  EachString({Key key, @required this.text ,@required this.style ,@required this.duration,@required this.onHoverTranslate}) : super(key: key);

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
            onHoverTranslate: widget.onHoverTranslate,
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
  final Matrix4 onHoverTranslate ;
  const TransalteContainer({Key key, @required this.child ,@required this.duration,this.onHoverTranslate}) : super(key: key);

  @override
  _TransalteContainerState createState() => _TransalteContainerState();
}

class _TransalteContainerState extends State<TransalteContainer> {

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final onHoverTranslate = widget.onHoverTranslate == null ? (Matrix4.identity()..translate(0, -10, 0)) : widget.onHoverTranslate;
    final onNonHoverTranslate = Matrix4.identity()..translate(0, 0, 0);
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
