import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
// user model
class Person {
  String id;
  final String name;
  final int age;

  Person({
    required this.name,
    required this.age,
    this.id = '',
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
