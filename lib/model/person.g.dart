// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************
// JSON ~ Object
Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      name: json['name'] as String,
      age: json['age'] as int,
      id: json['id'] as String? ?? '',
    );
// Object ~ JSON
Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
    };
