import 'dart:convert';

class Ride {
  String? title;
  DateTime? date;
  String? location;
  int? miles;
  String? difficulty;

  bool get isToday {
    return DateTime.now().isSameDate(date!);
  }

  Ride({this.title, this.date, this.location, this.miles, this.difficulty});

  factory Ride.fromJson(Map<String, Object?> json) {
    return Ride(
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      location: json['location'] as String,
      miles: json['miles'] as int,
      difficulty: json['difficulty'] as String,
    );
  }

  static List<Ride> decodeList(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed.map<Ride>((json) => Ride.fromJson(json)).toList();
  }
}

extension DateTimeCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
