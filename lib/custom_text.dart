import 'package:flutter/material.dart';

class customText extends StatelessWidget {
  const customText(
      {super.key,
      required this.text,
      required this.color,
      required this.size,
      required this.weight});
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
