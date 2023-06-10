// user model
class User {
  String id;
  late final String name;
  final String firstName;
  final int age;
  int count;

  User({
    this.name = '',
    this.firstName = '',
    this.age = 0,
    this.id = '',
    this.count = 0,
  });

  //to convert the 'final user = ...' to a map create the toJson methode
  // Object ~ JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'First Name': firstName,
        'age': age,
      };

  // fromJson method for reading data
  // JSON ~ Object

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        firstName: json['First Name'],
        age: json['age'],
      );
}
