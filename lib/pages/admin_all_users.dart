import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../backend_page_operations/read_from_firebase.dart';
import 'chat_page.dart';

class AllUsersList extends StatefulWidget {
  const AllUsersList({super.key});

  @override
  State<AllUsersList> createState() => _AllUsersListState();
}

class _AllUsersListState extends State<AllUsersList> {
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
    return Scaffold(
      body: FutureBuilder<dynamic>(
          future: getDocIDs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return ListView.builder(
                itemCount: docIDs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.deepOrange,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            PageTransition(
                              child: ChatPage(
                                recieverEmail: data['Email'],
                                recieverUserID: data['Uid'],
                              ),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
                        },
                        title: ReadFromFirebase(documentId: docIDs[index]),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Text('loading');
            }
          }),
    );
  }
}
