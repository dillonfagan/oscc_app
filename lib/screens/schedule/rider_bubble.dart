import 'package:flutter/material.dart';
import 'package:oscc_app/models/schedule/rider.dart';

class RiderBubble extends StatelessWidget {
  final Rider rider;

  const RiderBubble({required this.rider});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 2.0),
      child: Text(rider.name!),
    );
  }
}
