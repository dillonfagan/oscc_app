import 'package:firebase_database/firebase_database.dart';
import 'rider.dart';

class Ride {
  String id;
  String? title;
  DateTime? date;
  String? location;
  int? miles;
  String? difficulty;
  List<Rider>? riders;

  bool get isToday {
    return DateTime.now().isSameDate(date!);
  }

  Ride({
    required this.id,
    this.title,
    this.date,
    this.location,
    this.miles,
    this.difficulty,
    this.riders,
  });

  factory Ride.fromJson(String id, dynamic json) {
    return Ride(
      id: id,
      title: json['title'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(json['date'] as int).toLocal(),
      location: json['publicMeetingLocation'] as String,
      miles: json['miles'] as int,
      difficulty: json['difficulty'] as String,
      riders: mapRiders((json['riders'] as Map).values.toList()),
    );
  }

  factory Ride.fromSnapshot(DataSnapshot snapshot) {
    final key = snapshot.key!;
    final json = snapshot.value!;
    return Ride.fromJson(key, json);
  }

  static List<Ride> decodeList(Iterable<DataSnapshot> snapshots) {
    return snapshots.map((snapshot) => Ride.fromSnapshot(snapshot)).toList();
  }

  static List<Rider> mapRiders(List<dynamic>? jsonList) {
    if (jsonList == null) return List.empty();
    return jsonList.map((e) => Rider.fromJson(e)).toList();
  }
}

extension DateTimeCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
