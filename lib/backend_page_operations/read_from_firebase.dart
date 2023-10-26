// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReadFromFirebase extends StatelessWidget {
  final String documentId;
  const ReadFromFirebase({
    Key? key,
    required this.documentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //get the  collection

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('User email: ${data['email']}');
        } else {
          return Text('data');
        }
      },
    );
  }
}
