// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'ride.dart';

class ScheduleModel extends ChangeNotifier {
  static final List<Ride> _dummyRides = [
    Ride(
      title: "Narragansett",
      location: "DiCristofaro Park",
      date: "4/16/22",
      miles: 25.0,
      difficulty: "Medium",
    ),
    Ride(
      title: "South County",
      location: "Veterans' Memorial Cemetery",
      date: "4/12/22",
      miles: 15.0,
      difficulty: "Easy",
    ),
    Ride(
      title: "Big River Mountain Bike Ride",
      location: "301 South County Trail",
      date: "4/12/22",
      miles: 7.0,
      difficulty: "Medium",
    ),
  ];

  Future<Iterable<Ride>> getAll() async {
    return _dummyRides;

    // return FirebaseFirestore.instance
    //     .collection('rides')
    //     .get()
    //     .then((result) => result.docs)
    //     .then((docs) => docs.map((doc) => Ride.fromJson(doc.data())));
  }
}
