// user model
class User {
  String id;
  final String name;
  final int age;

  User({
    required this.name,
    required this.age,
    this.id = '',
  });

  //to convert the 'final user = ...' to a map create the toJson methode
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
      };

  // fromJson method for reading data

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        age: json['age'],
      );
}
