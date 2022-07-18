import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/bike_ride.dart';
import 'ride_card.dart';

class RidesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RidesPageState();
  }
}

class _RidesPageState extends State<RidesPage> {
  Stream<Iterable<BikeRide>> _rides = Stream.value([]);

  Future<void> _getRides() async {
    final supabase = Supabase.instance.client;
    final response = await supabase.from('Rides').select('*').execute();

    final error = response.error;
    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.message),
        duration: const Duration(seconds: 3),
      ));
    }

    final data = response.data;
    if (data != null) {
      final ridesData = data as List<dynamic>;
      final rides = ridesData.map((e) => BikeRide.fromMap(e));
      setState(() => _rides = Stream.value(rides));
    }
  }

  Widget _listView(List<BikeRide> rides) {
    return ListView.separated(
      padding: const EdgeInsets.all(8.0),
      itemCount: rides.length,
      itemBuilder: (context, index) => RideCard(rides[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 8.0),
      physics: const AlwaysScrollableScrollPhysics(),
    );
  }

  @override
  void initState() {
    super.initState();
    _getRides();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Iterable<BikeRide>>(
      initialData: const [],
      stream: _rides,
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
          onRefresh: _getRides,
          child: _listView(rides),
        );
      },
    );
  }
}
