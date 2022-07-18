class BikeRide {
  String? id;
  String? title;
  double? miles;
  String? publicLocation;
  DateTime? date;

  BikeRide({
    this.id,
    this.title,
    this.miles,
    this.publicLocation,
    this.date,
  });

  bool get isToday {
    return DateTime.now().isSameDate(date!);
  }

  factory BikeRide.fromMap(dynamic map) {
    return BikeRide(
      id: map['id'] as String?,
      title: map['title'] as String?,
      miles: map['miles'] as double?,
      publicLocation: map['public_location'] as String?,
      date: DateTime.parse(map['timestamp'] as String),
    );
  }
}

extension DateTimeCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
