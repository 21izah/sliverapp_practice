import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../constants/data_constant.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  User? user = FirebaseAuth.instance.currentUser;
  Future editfield(String walletType) async {
    String newValue = '';
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: primaryColor,
        title: Text(
          'Edit $walletType',
          style: TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: 'Enter new $walletType',
              hintStyle: TextStyle(color: Colors.white)),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
          TextButton(
              onPressed: () => Navigator.of(context).pop(newValue),
              child: Text(
                'Update',
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );

    if (newValue.trim().length > 0) {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.email)
          .update({
        walletType: newValue,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: screenSize.height * 0.2,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        // bottomRight: Radius.circular(70),
                        ),
                  ),
                ),
                Container(
                  height: screenSize.height * 0.8,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: const Text(
                              'BTC Wallet Address',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: screenSize.width - 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor),
                            margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FutureBuilder<DocumentSnapshot>(
                                  future: FirebaseFirestore.instance
                                      .collection('Users')
                                      .doc(user!.email)
                                      .get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      Map<String, dynamic> data = snapshot.data!
                                          .data() as Map<String, dynamic>;
                                      return Text(
                                        '${data['BTC Wallet Address']}',
                                        style: TextStyle(
                                          fontSize: screenSize.width * 0.03,
                                          fontWeight: FontWeight.bold,
                                          color: whiteColor,
                                        ),
                                      );
                                    } else {
                                      return Text('loading');
                                    }
                                  },
                                ),
                                GestureDetector(
                                  onTap: () {
                                    editfield('BTC Wallet Address');
                                  },
                                  child: Icon(
                                    Icons.edit_document,
                                    color: blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: const Text(
                              'Ethereum Wallet Address',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: screenSize.width - 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor),
                            margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FutureBuilder<DocumentSnapshot>(
                                  future: FirebaseFirestore.instance
                                      .collection('Users')
                                      .doc(user.email)
                                      .get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      Map<String, dynamic> data = snapshot.data!
                                          .data() as Map<String, dynamic>;
                                      return Text(
                                        ' ${data['Ethereum Wallet Address']}',
                                        style: TextStyle(
                                          fontSize: screenSize.width * 0.03,
                                          fontWeight: FontWeight.bold,
                                          color: whiteColor,
                                        ),
                                      );
                                    } else {
                                      return Text('loading');
                                    }
                                  },
                                ),
                                GestureDetector(
                                  onTap: () {
                                    editfield('Ethereum Wallet Address');
                                  },
                                  child: Icon(
                                    Icons.edit_document,
                                    color: blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: const Text(
                              'USDT TRC-20 Wallet Address',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: screenSize.width - 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor),
                            margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FutureBuilder<DocumentSnapshot>(
                                  future: FirebaseFirestore.instance
                                      .collection('Users')
                                      .doc(user.email)
                                      .get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      Map<String, dynamic> data = snapshot.data!
                                          .data() as Map<String, dynamic>;
                                      return Text(
                                        '${data['USDT TRC-20 Wallet Address']}',
                                        style: TextStyle(
                                          fontSize: screenSize.width * 0.03,
                                          fontWeight: FontWeight.bold,
                                          color: whiteColor,
                                        ),
                                      );
                                    } else {
                                      return Text('loading');
                                    }
                                  },
                                ),
                                GestureDetector(
                                  onTap: () {
                                    editfield('USDT TRC-20 Wallet Address');
                                  },
                                  child: Icon(
                                    Icons.edit_document,
                                    color: blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: const Text(
                              'USDT BEP-20 Wallet Address',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: screenSize.width - 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor),
                            margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FutureBuilder<DocumentSnapshot>(
                                  future: FirebaseFirestore.instance
                                      .collection('Users')
                                      .doc(user.email)
                                      .get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      Map<String, dynamic> data = snapshot.data!
                                          .data() as Map<String, dynamic>;
                                      return Text(
                                        ' ${data['USDT BEP-20 Wallet Address']}',
                                        style: TextStyle(
                                          fontSize: screenSize.width * 0.03,
                                          fontWeight: FontWeight.bold,
                                          color: whiteColor,
                                        ),
                                      );
                                    } else {
                                      return Text('loading');
                                    }
                                  },
                                ),
                                GestureDetector(
                                  onTap: () {
                                    editfield('USDT BEP-20 Wallet Address');
                                  },
                                  child: Icon(
                                    Icons.edit_document,
                                    color: blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
