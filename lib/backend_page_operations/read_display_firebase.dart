import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReadFirebaseOnly extends StatelessWidget {
  // final String documentId;
  const ReadFirebaseOnly({
    Key? key,
    // required this.documentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //get the  collection

    User? user = FirebaseAuth.instance.currentUser;
    final docUsers = FirebaseFirestore.instance.collection('users').doc();

    return FutureBuilder<DocumentSnapshot>(
      future:
          FirebaseFirestore.instance.collection('users').doc(docUsers.id).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('first name: ${data['First Name']} ${data['Surname']}');
        } else {
          return Text('data');
        }
      },
    );
  }
}

void getUserData() async {
  // Get the authenticated user
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    // Retrieve the user's document from Firestore
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    // Access the firstName field and display it
    String firstName = userSnapshot['firstName'];
    print('User\'s first name: $firstName');
  }
}
