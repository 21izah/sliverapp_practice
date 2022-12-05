import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReadDisplay extends StatelessWidget {
  ReadDisplay({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;
  // document IDs

  List<String> docIds = [];

  // get docIDs
  Future getDocId() async {
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
