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
  Stream<Iterable<Ride>> _rides = _api.getAll().asStream();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ride Schedule"),
        actions: [
          IconButton(onPressed: _refresh, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: StreamBuilder<Iterable<Ride>>(
        stream: _rides,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor));
          }

          final rides = snapshot.requireData.toList();

          if (rides.isEmpty) {
            return const Center(child: Text("No Rides Scheduled"));
          }

          return RefreshIndicator(
            onRefresh: _refresh,
            child: _listView(rides),
            color: Theme.of(context).primaryColorDark,
          );
        },
      ),
    );
  }

  Future<void> _refresh() async {
    final rides = _api.getAll().asStream();
    return Future.delayed(const Duration(milliseconds: 1200), () {
      setState(() => _rides = rides);
    });
  }

  Widget _listView(List<Ride> rides) {
    return ListView.separated(
      padding: const EdgeInsets.all(8.0),
      itemCount: rides.length,
      itemBuilder: (context, index) => RideCard(rides[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 8.0),
      physics: const AlwaysScrollableScrollPhysics(),
    );
  }
}
