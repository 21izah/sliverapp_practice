import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'chat_page.dart';

class AdminMessaged extends StatefulWidget {
  const AdminMessaged({super.key});

  @override
  State<AdminMessaged> createState() => _AdminMessagedState();
}

class _AdminMessagedState extends State<AdminMessaged> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: FutureBuilder<dynamic>(
        //     future: getDocIDs(),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.done) {
        //         Map<String, dynamic> data =
        //             snapshot.data!.data() as Map<String, dynamic>;
        //         return ListView.builder(
        //           itemCount: docIDs.length,
        //           itemBuilder: (context, index) {
        //             return Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: Container(
        //                 color: Colors.deepOrange,
        //                 child: ListTile(
        //                   onTap: () {
        //                     Navigator.of(context).push(
        //                       PageTransition(
        //                         child: ChatPage(
        //                           recieverEmail: data['email'],
        //                           recieverUserID: data['uid'],
        //                         ),
        //                         type: PageTransitionType.rightToLeft,
        //                       ),
        //                     );
        //                   },
        //                   title: ReadFromFirebase(documentId: docIDs[index]),
        //                 ),
        //               ),
        //             );
        //           },
        //         );
        //       } else {
        //         return Text('loading');
        //       }
        //     }),
        );
  }
}
