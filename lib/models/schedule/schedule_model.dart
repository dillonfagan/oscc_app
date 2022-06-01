import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'ride.dart';

class ScheduleModel extends ChangeNotifier {
  Future<Iterable<Ride>> getAll() async {
    return await RidesAPI().getAll(skipPastRides: skipPastRides);
  }

  static bool skipPastRides = true;
}

class RidesAPI {
  Future<Iterable<Ride>> getAll({bool skipPastRides = true}) async {
    Iterable<Ride> rides = await FirebaseDatabase.instance
        .ref()
        .get()
        .then((snapshot) => snapshot.children)
        .then((rideSnapshots) => Ride.decodeList(rideSnapshots));

    if (skipPastRides) {
      rides = rides.where((ride) => ride.date!.isAfter(DateTime.now()));
    }

    return rides;
  }

  rsvp(String id, String name) async {
    final database = FirebaseDatabase.instance.ref("$id/riders");
    final newRider = database.push();
    await newRider.set({"name": name});
  }
}
