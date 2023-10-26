// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sliverapp_practice/constants/data_constant.dart';
import 'package:sliverapp_practice/model/date_format.dart';

import '../riverpod_practice/transaction_service.dart';
import '../widgets/transaction_container.dart';
import 'transaction_details_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DeclinedTabPage extends StatefulWidget {
  const DeclinedTabPage({Key? key}) : super(key: key);

  @override
  State<DeclinedTabPage> createState() => _DeclinedTabPageState();
}

class _DeclinedTabPageState extends State<DeclinedTabPage> {
  final TransactionService _transactionService = TransactionService();

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('transaction')
            .doc(user!.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;

            List<dynamic> decliedTransaction = userData['decliedTransaction'];

            return ListView.builder(
                itemCount: decliedTransaction.length,
                itemBuilder: (context, index) {
                  return TransactionContainer(
                    TimeOfTransation: DateFormat.jms().format(DateTime.now()),
                    youGetNairaAmount: decliedTransaction[index]
                        ['transactionNairaAmount'],
                    DateOfTransation:
                        DateFormat.MMMMEEEEd().format(DateTime.now()),
                    TransactionAmount: decliedTransaction[index]
                        ['transactionAmount'],
                    transactionType: decliedTransaction[index]
                        ['transactionType'],
                  );
                });
          } else if (snapshot.hasError) {
            return Center(child: Text('data'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
