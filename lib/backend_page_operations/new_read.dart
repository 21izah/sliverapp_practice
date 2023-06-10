// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewRead extends StatelessWidget {
  const NewRead({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    //  final _currentUser = FirebaseAuth.instance.currentUser!.uid;
    final _users = FirebaseFirestore.instance.collection('users');
    final _usersDocUID =
        FirebaseFirestore.instance.collection('users').doc().id;

    User? user = FirebaseAuth.instance.currentUser!;
    final _UserUID = user.uid;

    final DocumentReference _userUID = _users.doc(_UserUID);

    final _do = _userUID.get();

    final _do1 = FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: _userUID)
        .get();

    // ignore: unused_element
    Future getDocID() async {
      // final docUsers = FirebaseFirestore.instance.collection('users').doc();
      await _do;
    }

    return FutureBuilder<DocumentSnapshot>(
      future: _do,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return Text('first name: ${data['First Name']} ${data['Surname']}');
        } else {
          return Text('${snapshot.error}');
        }
      },
    );
  }
}
