import 'package:flutter/material.dart';

class PaddingFactory {
  static Widget vertical({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 2.0, 0, 2.0),
      child: child,
    );
  }
}
