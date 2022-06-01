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

  factory Ride.fromJson(dynamic json) {
    return Ride(
      title: json['title'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(json['date'] as int).toLocal(),
      location: json['publicMeetingLocation'] as String,
      miles: json['miles'] as int,
      difficulty: json['difficulty'] as String,
      riders: mapRiders(json['riders'] as List),
    );
  }

  static List<Ride> decodeList(List<dynamic>? json) {
    if (json == null) {
      return List.empty();
    }

    return json.map<Ride>((ride) => Ride.fromJson(ride)).toList();
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
