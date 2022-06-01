import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oscc_app/models/schedule/ride.dart';
import 'package:oscc_app/models/schedule/schedule_model.dart';
import 'package:oscc_app/screens/schedule/rider_bubble.dart';
import 'padded_text.dart';

class RideCard extends StatelessWidget {
  final Ride ride;

  const RideCard(this.ride);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => _rsvp(context),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      PaddedText(DateFormat('h:mm a').format(ride.date!)),
                      PaddedText("${ride.miles!} miles"),
                      PaddedText(ride.difficulty!),
                    ],
                  ),
                ],
              ),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 8.0,
                children:
                    ride.riders!.map((rider) => RiderBubble(rider)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _rsvp(context) {
    showDialog(
      context: context,
      builder: (context) {
        final api = RidesAPI();
        final controller = TextEditingController();

        return AlertDialog(
          title: const Text("Who's Going?"),
          content: TextField(
            controller: controller,
            enableSuggestions: false,
          ),
          actions: [
            TextButton(
              onPressed: () async {
                await api.rsvp(ride.id, controller.text);
                Navigator.pop(context);
              },
              child: const Text("RSVP"),
            ),
          ],
        );
      },
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
