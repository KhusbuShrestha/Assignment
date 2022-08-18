import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final int maxLines;
  final TextOverflow textOverflow;

  GText(
      {Key? key,
      required this.text,
      this.fontSize = 14.0,
      this.fontWeight = FontWeight.normal,
      this.textOverflow = TextOverflow.visible,
      this.maxLines = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        "$text", textAlign: TextAlign.left,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight, ),
        overflow: textOverflow,
        maxLines: maxLines,
      ),
    );
  }
}
