import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class StreamFirstName extends StatefulWidget {
  const StreamFirstName({super.key});

  @override
  State<StreamFirstName> createState() => _StreamFirstNameState();
}

class _StreamFirstNameState extends State<StreamFirstName> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  // @override
  // void initState() {
  //   super.initState();
  //   widget.c
  // }
  @override
  Widget build(BuildContext context) {
    // CollectionReference users = FirebaseFirestore.instance.collection('users');
    // final docSnapshot =
    //     users.where('id', isEqualTo: users.doc().id).snapshots();
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .orderBy('uid', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final data = snapshot.data!.docs[index];
              return Text(
                  'first name: ${data['First Name']} phone number: ${data['Phone Number']}');
            },
          );

          // Text('first name: ${data['First Name']} ${data['Surname']}');
        } else {
          return Text('error: ${snapshot.error}');
        }
      },
    );
  }
}
