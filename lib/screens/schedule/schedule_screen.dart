import 'dart:async';
import 'package:flutter/material.dart';
import 'package:oscc_app/models/schedule/schedule_model.dart';
import '../../models/schedule/ride.dart';
import 'ride_card.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScheduleState();
}

class _ScheduleState extends State<ScheduleScreen> {
  static final _api = RidesAPI();
  Future<Iterable<Ride>> _rides = _api.getAll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Iterable<Ride>>(
        stream: _rides.asStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.blue));
          }

          final rides = snapshot.requireData.toList();

          if (rides.isEmpty) {
            return const Center(child: Text("No Rides Scheduled"));
          }

          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.separated(
              itemCount: rides.length,
              itemBuilder: (context, index) => RideCard(rides[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 8.0),
              physics: const AlwaysScrollableScrollPhysics(),
            ),
          );
        },
      ),
    );
  }

  Future<void> _refresh() async {
    setState(() => _rides = _api.getAll());
  }
}
