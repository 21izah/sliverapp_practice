import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../pages/chat_page.dart';
import 'option_selection.dart';

class ThemeContainer extends StatelessWidget {
  const ThemeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('Users')
            .doc('F3nkSVLD3gO9akXuZYZTSPUCs2m1')
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return GestureDetector(
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
              child: OptionSelection(
                textHeaderColor: Theme.of(context).colorScheme.tertiary,
                iconImage: Icon(
                  Icons.messenger,
                  color: Colors.amber[700],
                ),
                TextHeader: 'Customer Support',
              ),
            );
          } else {
            return Center(
              child: OptionSelection(
                textHeaderColor: Theme.of(context).colorScheme.tertiary,
                iconImage: Icon(
                  Icons.messenger,
                  color: Colors.amber[700],
                ),
                TextHeader: 'Customer Support',
              ),
            );
          }
        });
  }
}
