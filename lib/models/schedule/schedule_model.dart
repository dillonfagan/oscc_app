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
    final snapshot = await FirebaseDatabase.instance.ref().get();

    Iterable<Ride> rides = Ride.decodeList(snapshot.value as List);

    if (kDebugMode) {
      print("Data received from Firebase.");
      print(snapshot.value);
    }

    if (skipPastRides) {
      rides = rides.where((ride) => ride.date!.isAfter(DateTime.now()));
    }

    return rides;
  }
}
