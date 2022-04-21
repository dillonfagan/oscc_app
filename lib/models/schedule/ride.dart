class Ride {
  String? title;
  String? date;
  String? location;
  double? miles;
  String? difficulty;

  Ride({this.title, this.date, this.location, this.miles, this.difficulty});

  Ride.fromJson(Map<String, Object?> json)
      : this(
          title: json['title'] as String,
          date: json['date'] as String,
          location: json['location'] as String,
          miles: json['miles'] as double,
          difficulty: json['difficulty'] as String,
        );
}
