import 'package:flutter/material.dart';

class FundraisingModel extends ChangeNotifier {
  static const double goal = 100000;
  static const double total = 70000;

  double get progress => total / goal;
}
