// ignore_for_file: unused_import, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final userDoc = FirebaseFirestore.instance.collection('users').doc(userId);
    final _UserUID = FirebaseAuth.instance.currentUser!.uid;

    final firestore = FirebaseFirestore.instance;
    final _UserDocUID = firestore.collection('users').doc(_UserUID).id;
    final docSnapshot = firestore
        .collection('users')
        .where('id', isEqualTo: _UserUID)
        .snapshots();
    // ignore: unused_local_variable
    final docSnapshots = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseFirestore.instance.collection('users').doc().id)
        .get();
    return Scaffold(
      backgroundColor: Colors.amber,
      body: StreamBuilder(
        stream: docSnapshot,
        builder: (context, snapshot) {
          print(_UserUID);
          print(_UserDocUID);
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                QueryDocumentSnapshot x = snapshot.data!.docs[index];
                final firstName = x['First Name'];
                final surname = x['Surname'];
                print(firstName);
                return Center(
                    child: Text(
                  'first name: $firstName  surname: $surname',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ));
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
          // String firstName;
            // snapshot.data!.docs.forEach(
            //   (element) {
            //     if (element.data().containsKey('First Name')) {
            //       firstName = element.data()['First Name'];
            //     }
            //   },
            // );

            // if (firstName != null) {
            //   return Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Center(child: Text('first name: $firstName')),
            //     ],
            //   );
            // } else {
            //   return Text('data');
            // }