// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sliverapp_practice/backend_page_operations/read_from_firebase.dart';

import 'new_read.dart';

class UserFirstName extends StatelessWidget {
  final _UserUID = FirebaseAuth.instance.currentUser!.uid;
  final docId = FirebaseFirestore.instance.collection('users').doc().get();
  // get docIds
  Future getDocID() async {
    // final docUsers = FirebaseFirestore.instance.collection('users').doc();
    await FirebaseFirestore.instance.collection('users').doc(_UserUID).get();
  }

  UserFirstName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.deepOrange,
              child: ListTile(
                title: NewRead(),
              ),
            ),
          );
        },
      ),
    );
  }
}
