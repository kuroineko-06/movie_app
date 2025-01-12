import 'package:flutter/material.dart';

class TextDetailStyle extends StatelessWidget {
  final String text;
  final Color? color;
  const TextDetailStyle({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Text(text,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 16,
            color: color ?? Colors.white,
          )),
    );
  }
}
