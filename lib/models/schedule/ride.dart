import 'dart:convert';
import 'rider.dart';

class Ride {
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
    this.title,
    this.date,
    this.location,
    this.miles,
    this.difficulty,
    this.riders,
  });

  factory Ride.fromJson(Map<String, Object?> json) {
    return Ride(
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String).toLocal(),
      location: json['location'] as String,
      miles: json['miles'] as int,
      difficulty: json['difficulty'] as String,
      riders: mapRiders(json['riders'] as List<dynamic>),
    );
  }

  static List<Ride> decodeList(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed.map<Ride>((json) => Ride.fromJson(json)).toList();
  }

  static List<Rider> mapRiders(List<dynamic> jsonList) {
    return jsonList
        .map((e) => Rider.fromJson(e as Map<String, Object?>))
        .toList();
  }
}

extension DateTimeCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
