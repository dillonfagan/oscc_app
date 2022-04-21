import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProgressBar extends StatelessWidget {
  final double value;

  const ProgressBar({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 80,
          child: LinearProgressIndicator(
            value: 0.7,
            backgroundColor: Colors.lightBlue[200],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            NumberFormat.currency(symbol: '\$', decimalDigits: 0)
                .format(value * 100000),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
