import 'Hipo.dart';

class Member{
  final String name;
  final int age;
  final String location;
  final String github;
  final Hipo hipo;

  Member(this.name, this.age, this.location, this.github, this.hipo);
  Member.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        location = json['location'],
        github = json['github'],
        hipo = Hipo.fromJson(json['hipo']);

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'age': age,
        'location': location,
        'github': github,
        'hipo': hipo.toJson(),
      };
}