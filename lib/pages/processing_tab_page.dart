// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sliverapp_practice/model/date_format.dart';
import 'package:sliverapp_practice/widgets/transaction_container.dart';

import '../constants/data_constant.dart';
import '../riverpod_practice/transaction_service.dart';
import 'transaction_details_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProcessingTabPage extends StatefulWidget {
  const ProcessingTabPage({Key? key}) : super(key: key);

  @override
  State<ProcessingTabPage> createState() => _ProcessingTabPageState();
}

class _ProcessingTabPageState extends State<ProcessingTabPage> {
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

            List<dynamic> ProcessingTransaction =
                userData['ProcessingTransaction'];

            return ListView.builder(
                itemCount: ProcessingTransaction.length,
                itemBuilder: (context, index) {
                  return TransactionContainer(
                    TimeOfTransation: DateFormat.jms().format(DateTime.now()),
                    youGetNairaAmount: ProcessingTransaction[index]
                        ['transactionNairaAmount'],
                    DateOfTransation:
                        DateFormat.MMMMEEEEd().format(DateTime.now()),
                    TransactionAmount: ProcessingTransaction[index]
                        ['transactionAmount'],
                    transactionType: ProcessingTransaction[index]
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
