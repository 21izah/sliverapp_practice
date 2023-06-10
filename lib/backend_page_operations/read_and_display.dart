// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReadDisplay extends StatelessWidget {
  const ReadDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<User>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text('something went wrong! ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
              children: users.map(buildUser).toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
  // ListView(
  //                 children: users.map(buildUser).toList(),
  //               );

  Widget buildUser(User user) => Text(
        user.name,
        style: const TextStyle(fontSize: 20, color: Colors.deepOrange),
      );

  // method to read data
  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
}

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
// converting it to map
  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        age: json['age'],
      );
}
