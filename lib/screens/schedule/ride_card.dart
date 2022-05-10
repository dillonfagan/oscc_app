import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oscc_app/models/schedule/ride.dart';
import 'padded_text.dart';
import 'rider_bubble.dart';

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
                const SizedBox(height: 10.0),
                Wrap(
                  spacing: 10.0,
                  children:
                      ride.riders!.map((r) => RiderBubble(rider: r)).toList(),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _DateText(ride: ride),
                PaddedText(DateFormat('h:mm a').format(ride.date!)),
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
        : PaddedText(DateFormat('M/d/yy').format(ride.date!));
  }
}
