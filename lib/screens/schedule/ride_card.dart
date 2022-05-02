import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oscc_app/models/schedule/ride.dart';
import 'package:oscc_app/screens/schedule/padded_text.dart';

class RideCard extends StatelessWidget {
  final Ride ride;

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
                PaddedText(ride.location!),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _DateText(ride: ride),
                PaddedText("${ride.miles!} miles"),
                PaddedText(ride.difficulty!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DateText extends StatelessWidget {
  final Ride ride;

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
        : PaddedText(DateFormat('MM/dd/yy').format(ride.date!));
  }
}
