// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sliverapp_practice/constants/data_constant.dart';

import '../model/date_format.dart';
import '../riverpod_practice/transaction_service.dart';
import '../widgets/transaction_container.dart';
import 'transaction_details_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SuccesfulTabPage extends StatefulWidget {
  // final String transactionType;
  // final String DateOfTransation;
  // final String TransactionAmount;

  const SuccesfulTabPage({
    super.key,
    // required this.transactionType,
    // required this.DateOfTransation,
    // required this.TransactionAmount,
  });

  @override
  State<SuccesfulTabPage> createState() => _SuccesfulTabPageState();
}

class _SuccesfulTabPageState extends State<SuccesfulTabPage> {
  // final TransactionService _transactionService = TransactionService();

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

            List<dynamic> successfulTransaction =
                userData['successfulTransaction'];

            return ListView.builder(
                itemCount: successfulTransaction.length,
                itemBuilder: (context, index) {
                  return TransactionContainer(
                    TimeOfTransation: DateFormat.jms().format(DateTime.now()),
                    youGetNairaAmount: successfulTransaction[index]
                        ['transactionNairaAmount'],
                    DateOfTransation:
                        DateFormat.MMMMEEEEd().format(DateTime.now()),
                    TransactionAmount: successfulTransaction[index]
                        ['transactionAmount'],
                    transactionType: successfulTransaction[index]
                        ['transactionType'],
                  );
                });
          } else if (snapshot.hasError) {
            return Center(child: Text('data'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },

        // DateTime.now().toString()
      ),
    );
  }
}
