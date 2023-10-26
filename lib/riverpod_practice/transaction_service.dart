import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TransactionService extends ChangeNotifier {
  final _username = Hive.box('username');

  List<List<dynamic>> successfulTransactions = [
    ['withdrawal', '2000', '20 / 20 / 2012'],
    ['deposit', '400', '34 / 20 / 2012'],
    ['deposit', '400', '34 / 20 / 2012'],
  ];

  List<List<dynamic>> processingTransactions = [
    ['withdrawal', '6272', '20 / 20 / 2012'],
    ['deposit', '632', '34 / 20 / 2012'],
  ];

  List<List<dynamic>> declinedTransactions = [
    ['withdrawal', '2983922938', '20 / 20 / 2012'],
    ['deposit', '3434', '34 / 20 / 2012'],
    ['deposit', '56344', '34 / 20 / 2012'],
  ];

  // add transaction

  void addTransaction() {
    processingTransactions.add(
      ['withdrawal', '7363', '20 / 20 / 2083'],
    );
    notifyListeners();
    print('successful add');
    notifyListeners();
    // print(processingTransactions);
    // notifyListeners();
    _username.put(100, processingTransactions);
    notifyListeners();
    print(_username.get(100).toString());
    notifyListeners();
  }

  void addTransactionDoc() {
    processingTransactions.add(
      ['withdrawal', '7363', '20 / 20 / 2083'],
    );
    notifyListeners();
    print('successful add');
    notifyListeners();
    // print(processingTransactions);
    // notifyListeners();
    _username.put(100, processingTransactions);
    notifyListeners();
    print(_username.get(100).toString());
    notifyListeners();
  }

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //     User? user = FirebaseAuth.instance.currentUser;
  //      _firestore.collection('transaction').doc(user!.email).set(
  //       {
  //         'successfulTransaction': [],
  //         'decliedTransaction': [],
  //         'ProcessingTransaction: [],

  //       },
  //       SetOptions(merge: true),
  //     );
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //     User? user = FirebaseAuth.instance.currentUser;
  //      _firestore.collection('processingTransactions').doc(user!.email).set(
  //       {
  //         'First Pin': 34343434,
  //         'Second Pin': 34343434,
  //         'Third Pin': 34343434,
  //         'Fourth Pin': 34343434,
  //       },
  //       SetOptions(merge: true),
  //     );
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //     User? user = FirebaseAuth.instance.currentUser;
  //      _firestore.collection('declinedTransactions').doc(user!.email).set(
  //       {
  //         'First Pin': 34343434,
  //         'Second Pin': 34343434,
  //         'Third Pin': 34343434,
  //         'Fourth Pin': 34343434,
  //       },
  //       SetOptions(merge: true),
  //     );
}
