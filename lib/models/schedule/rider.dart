class Rider {
  String? name;

  Rider({this.name});

  factory Rider.fromJson(Map<String, Object?> json) {
    return Rider(name: json['name'] as String);
  }
}
