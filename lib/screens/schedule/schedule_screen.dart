import 'package:flutter/material.dart';
import 'package:oscc_app/models/schedule/schedule_model.dart';
import 'package:provider/provider.dart';
import '../../models/schedule/ride.dart';
import 'ride_card.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScheduleState();
}

class _ScheduleState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleModel>(
      builder: (context, schedule, child) {
        return Scaffold(
          body: StreamBuilder<Iterable<Ride>>(
              stream: schedule.getAll().asStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }

                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final rides = snapshot.requireData.toList();

                return ListView.builder(
                  itemCount: rides.length,
                  itemBuilder: (context, index) => RideCard(rides[index]),
                );
              }),
        );
      },
    );
  }
}
