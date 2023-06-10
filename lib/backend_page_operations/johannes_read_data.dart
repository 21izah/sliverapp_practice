import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/user.dart';

class JohannesReadData extends StatelessWidget {
  const JohannesReadData({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildUser(User user) {
      return ListTile(
        title: Text(user.firstName),
      );
    }

    Stream<List<User>> readUsers() {
      return FirebaseFirestore.instance
          .collection('users')
          .snapshots()
          .map((x) => x.docs.map((y) => User.fromJson(y.data())).toList());
    }

    return Scaffold(
      body: StreamBuilder<List<User>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
              children: users.map(buildUser).toList(),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
