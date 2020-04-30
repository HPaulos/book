class City {
  const City({this.id, this.name});

  final int id;
  final String name;

  factory City.fromJson(dynamic json) {
    return City(id: json['id'] as int, name: json['city'] as String);
  }
}
