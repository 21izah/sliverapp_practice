import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sliverapp_practice/backend_page_operations/read_from_firebase.dart';

class GetFirstName extends StatefulWidget {
  GetFirstName({
    Key? key,
  }) : super(key: key);

  @override
  State<GetFirstName> createState() => _GetFirstNameState();
}

class _GetFirstNameState extends State<GetFirstName> {
  // list of documet Ids
  List<String> docIDs = [];

  // get docIds
  Future getDocIDs() async {
    // final docUsers = FirebaseFirestore.instance.collection('users').doc();
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((x) => x.docs.forEach((document) {
              docIDs.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser!.email);
    print(FirebaseAuth.instance.currentUser!.uid);
    print(FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .id);
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: getDocIDs(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: docIDs.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.deepOrange,
                  child: ListTile(
                    title: ReadFromFirebase(documentId: docIDs[index]),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
