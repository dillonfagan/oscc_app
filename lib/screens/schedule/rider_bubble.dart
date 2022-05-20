import 'package:flutter/material.dart';
import 'package:oscc_app/models/schedule/rider.dart';

class RiderBubble extends StatelessWidget {
  final Rider rider;

  const RiderBubble(this.rider);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(rider.name!),
      backgroundColor: Theme.of(context).primaryColorLight,
      avatar: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColorDark,
        foregroundColor: Colors.white,
        child: Text(rider.name!.substring(0, 1).toUpperCase()),
      ),
    );
  }
}
