import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/bike_ride.dart';
import '../../common/padded_text.dart';

class RideCard extends StatelessWidget {
  final BikeRide ride;

  const RideCard({Key? key, required this.ride}) : super(key: key);

  String _formatTitle() {
    final date =
        ride.isToday ? 'Today' : DateFormat('MMMM d').format(ride.date!);
    final time = DateFormat('h:mm a').format(ride.date!);
    return '$date @ $time';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PaddedText(
                  _formatTitle(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                PaddedText(ride.publicLocation!),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                PaddedText("${ride.miles!} miles"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
