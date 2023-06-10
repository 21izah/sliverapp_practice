import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetFirstUserName extends StatelessWidget {
  final String documentId;
  const GetFirstUserName({
    Key? key,
    required this.documentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        // if (snapshot.hasData && !snapshot.data!.exists) {
        //   return Text("Document does not exist");
        // }

        // if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasData && !snapshot.data!.exists) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                "Full Name: ${data['First Name']} ${data['Surname']}",
                style: TextStyle(fontSize: 20),
              )),
            ],
          );
        }

        return Text("loading");
      },
    );
  }
}
