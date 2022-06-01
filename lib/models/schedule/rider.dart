class Rider {
  String? name;

  Rider({this.name});

  factory Rider.fromJson(dynamic json) {
    return Rider(name: json['name'] as String);
  }
}
