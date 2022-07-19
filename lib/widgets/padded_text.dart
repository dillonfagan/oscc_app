import 'package:flutter/material.dart';
import 'padding_factory.dart';

class PaddedText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const PaddedText(this.text, {this.style});

  @override
  Widget build(BuildContext context) {
    return PaddingFactory.vertical(
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
