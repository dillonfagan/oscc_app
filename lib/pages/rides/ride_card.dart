import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/bike_ride.dart';
import '../../screens/schedule/padded_text.dart';

class RideCard extends StatelessWidget {
  final BikeRide ride;

  const RideCard(this.ride);

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
                  ride.title!,
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
                _DateText(ride: ride),
                PaddedText(DateFormat('h:mm a').format(ride.date!)),
                PaddedText("${ride.miles!} miles"),
                const PaddedText('Easy'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DateText extends StatelessWidget {
  final BikeRide ride;

  const _DateText({required this.ride});

  @override
  Widget build(BuildContext context) {
    return ride.isToday
        ? const PaddedText(
            "Today!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          )
        : PaddedText(DateFormat('M/d/yy').format(ride.date!));
  }
}
