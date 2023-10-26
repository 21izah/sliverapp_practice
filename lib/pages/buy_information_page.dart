import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sliverapp_practice/pages/welcomesixth_page.dart';

import '../constants/data_constant.dart';

import 'package:clipboard/clipboard.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

import '../riverpod_practice/transaction_service.dart';
import '../widgets/popup_menu_button.dart';

import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';

import 'tab_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BuyInformationPage extends StatefulWidget {
  final String youGetAmount;
  final String youGetNairaAmount;

  const BuyInformationPage({
    super.key,
    required this.youGetAmount,
    required this.youGetNairaAmount,
  });

  @override
  State<BuyInformationPage> createState() => _BuyInformationPageState();
}

class _BuyInformationPageState extends State<BuyInformationPage> {
  bool _buttonDisabled = false;
  final TransactionService _transactionService = TransactionService();

  addTransaction() {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentReference documentRef =
        FirebaseFirestore.instance.collection('transaction').doc(user!.email);

    // retrieve current list

    documentRef.get().then((documentSnapshot) {
      if (documentSnapshot.exists) {
        List<dynamic> currentlist = documentSnapshot['successfulTransaction'];

        // add new data to the list
        currentlist.add({
          'transactionType': 'withdrawal',
          'transactionAmount': '${widget.youGetAmount}',
          'transactionNairaAmount': '${widget.youGetNairaAmount}'
        });
        // update list to current list
        documentRef.update({'successfulTransaction': currentlist});
      } else {
        print('document does not exist');
      }
    }).catchError((error) {
      print('error retriving document: $error');
    });
  }

  Future showMessage(String message) async {
    Get.bottomSheet(
      Container(
        height: 400,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              child: Image.asset(
                'lib/assets/success.png',
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    Future.delayed(Duration(seconds: 2), () {
      Get.back();
      Get.off(() => TabBarWidget());
    });
  }

  Future showAccountMessage(String message) async {
    Get.snackbar(
      '2083912405',
      'Account Number copied successfully',
      // backgroundColor: Colors.green,
      // colorText: Colors.white,
      // // borderColor: Colors.amber,

      // borderRadius: 10,
      // boxShadows: [
      //   BoxShadow(
      //     color: Colors.blue,
      //     offset: Offset(10, 10),
      //   )
      // ],
    );
  }

  // bool _buttonDisabled = false;

  Future _handleRefresh() async {
    return Future.delayed(const Duration(seconds: 2));
  }

  final _accountNumberController = TextEditingController();
  final _nameOnBankAccountController = TextEditingController();
  final _bankNameController = TextEditingController();

  @override
  void dispose() {
    _accountNumberController.dispose();
    _nameOnBankAccountController.dispose();
    _bankNameController.dispose();

    super.dispose();
  }

  int selectedIndex = 0;
  final _username = Hive.box('username');

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: const [
          PopUpMenuButtonWidget(),
        ],
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
      ),
      backgroundColor: primaryColor,
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: screenSize.height * 0.2,
                    decoration: BoxDecoration(
                      color: primaryColor,
                    ),
                  ),
                  Container(
                    height: screenSize.height * 0.65,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10,
                          // top: 10,
                          bottom: 10,
                        ),
                        child: ValueListenableBuilder(
                          valueListenable: _username.listenable(),
                          builder: (context, value, child) =>
                              LiquidPullToRefresh(
                            onRefresh: _handleRefresh,
                            color: Colors.grey[900],
                            animSpeedFactor: 2,
                            backgroundColor: Colors.deepOrange,
                            showChildOpacityTransition: false,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 40,
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: screenSize.height * 0.055,
                                        decoration: BoxDecoration(
                                            color: Colors.deepOrange,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(5),
                                        child: const Text(
                                          'Wallet Address',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      FutureBuilder<DocumentSnapshot>(
                                        future: FirebaseFirestore.instance
                                            .collection('Users')
                                            .doc(user!.uid)
                                            .get(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            Map<String, dynamic> data =
                                                snapshot.data!.data()
                                                    as Map<String, dynamic>;
                                            return Container(
                                              width: screenSize.width - 148,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.grey[200],
                                              ),
                                              margin: const EdgeInsets.fromLTRB(
                                                  5, 5, 5, 5),
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 20, 20, 20),
                                              child: Text(
                                                '${data['BTC Wallet Address']}',
                                                style: TextStyle(
                                                  fontSize:
                                                      screenSize.width * 0.03,
                                                  fontWeight: FontWeight.bold,
                                                  color: blackColor,
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Container(
                                              height: 10,
                                              width: 10,
                                              child: Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                color: Colors.deepOrange,
                                              )),
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: screenSize.height * 0.055,
                                        decoration: BoxDecoration(
                                            color: Colors.deepOrange,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(5),
                                        child: const Text(
                                          'Network',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        width: screenSize.width - 110,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[200],
                                        ),
                                        margin: const EdgeInsets.fromLTRB(
                                            5, 5, 5, 5),
                                        padding:
                                            EdgeInsets.fromLTRB(20, 20, 20, 20),
                                        child: Text(
                                          'BEP-20',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: screenSize.height * 0.055,
                                        decoration: BoxDecoration(
                                            color: Colors.deepOrange,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(5),
                                        child: const Text(
                                          'You Get',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        width: screenSize.width - 107,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[200],
                                        ),
                                        margin: const EdgeInsets.fromLTRB(
                                            5, 5, 5, 5),
                                        padding:
                                            EdgeInsets.fromLTRB(20, 20, 20, 20),
                                        child: Text(
                                          widget.youGetAmount,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: screenSize.height * 0.055,
                                        decoration: BoxDecoration(
                                            color: Colors.deepOrange,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(5),
                                        child: const Text(
                                          'Bank',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        width: screenSize.width - 91,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[200],
                                        ),
                                        margin: const EdgeInsets.fromLTRB(
                                            5, 5, 5, 5),
                                        padding:
                                            EdgeInsets.fromLTRB(20, 20, 20, 20),
                                        child: Text(
                                          'Zenith Bank',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: screenSize.width - 30,
                                        alignment: Alignment.center,
                                        height: screenSize.height * 0.055,
                                        decoration: BoxDecoration(
                                            color: Colors.deepOrange,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(5),
                                        child: Text(
                                          'Pay NGN ${widget.youGetNairaAmount} to Account Number Below',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Builder(builder: (context) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: screenSize.height * 0.055,
                                          decoration: BoxDecoration(
                                              color: Colors.deepOrange,
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          padding: EdgeInsets.all(10),
                                          margin: const EdgeInsets.all(5),
                                          child: const Text(
                                            'Account Number',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          width: screenSize.width * 0.45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey[200],
                                          ),
                                          margin: const EdgeInsets.fromLTRB(
                                              5, 5, 5, 5),
                                          padding: EdgeInsets.all(20),
                                          child: Text(
                                            '2083912405',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: _buttonDisabled
                                              ? null
                                              : () async {
                                                  setState(() {
                                                    _buttonDisabled = true;
                                                  });
                                                  await FlutterClipboard.copy(
                                                      '2083912405');

                                                  showAccountMessage(
                                                      'Account Number Copied To clipboard');
                                                },
                                          child: Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.deepOrange,
                                              ),
                                              margin: const EdgeInsets.fromLTRB(
                                                  5, 5, 5, 5),
                                              child: Icon(Icons.copy_rounded)),
                                        ),
                                      ],
                                    );
                                  }),
                                  Builder(
                                    builder: (context) {
                                      final GlobalKey<SlideActionState> _key =
                                          GlobalKey();
                                      return Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: SlideAction(
                                          innerColor: Colors.green,
                                          sliderButtonIconPadding: 10,
                                          sliderButtonIconSize: 10,
                                          outerColor: Colors.deepOrange,
                                          // innerColor: Colors.deepOrange,
                                          borderRadius: 20,
                                          height: screenSize.height * 0.07,
                                          key: _key,
                                          onSubmit: () {
                                            addTransaction();
                                            showMessage(
                                                'Transaction successful');
                                          },
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'Swipe to comfirm',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          sliderButtonIcon: Icon(
                                            Icons.check,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  // GestureDetector(
                                  //   onTap: _transactionService.addTransaction,
                                  //   child: Container(
                                  //     decoration: BoxDecoration(
                                  //         borderRadius: BorderRadius.circular(10),
                                  //         color: Colors.deepOrange),
                                  //     height: 50,
                                  //     margin:
                                  //         const EdgeInsets.fromLTRB(5, 20, 0, 5),
                                  //     padding:
                                  //         const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  //     child: Center(
                                  //         child: const Text(
                                  //       "Chat With Us",
                                  //       style: TextStyle(color: Colors.white),
                                  //     )),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //     padding: const EdgeInsets.all(20.0),
                      //     child: Center(
                      //       child: SlideAction(
                      //         sliderButtonIconSize: 10,
                      //         height: 55,
                      //         borderRadius: 10,
                      //         outerColor: Colors.deepOrange,
                      //         innerColor: Colors.black,
                      //         text: 'Slide to comfirm Transaction',
                      //         textStyle: TextStyle(
                      //             color: Colors.white,
                      //             fontSize: 17,
                      //             fontWeight: FontWeight.bold),
                      //         sliderRotate: false,
                      //         onSubmit: () {
                      //           showModalBottomSheet(
                      //             context: context,
                      //             builder: (context) {
                      //               return Container(
                      //                 height: 400,
                      //                 decoration: const BoxDecoration(
                      //                     color: Colors.white,
                      //                     borderRadius: BorderRadius.vertical(
                      //                         top: Radius.circular(20))),
                      //                 child: Column(
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment.center,
                      //                     children: [
                      //                       // SizedBox(
                      //                       //   height: 20,
                      //                       // ),
                      //                       Container(
                      //                         height: 200,
                      //                         width: 200,
                      //                         child: Image.asset(
                      //                           'lib/assets/success.png',
                      //                           fit: BoxFit.scaleDown,
                      //                         ),
                      //                       ),
                      //                       const SizedBox(
                      //                         height: 10,
                      //                       ),
                      //                       const Text(
                      //                         'More Cashout Investor!',
                      //                         style: TextStyle(
                      //                             fontSize: 25,
                      //                             fontWeight: FontWeight.bold),
                      //                       ),
                      //                     ]),
                      //               );
                      //             },
                      //           );
                      //           Future.delayed(Duration(seconds: 2), () {
                      //             Navigator.pop(context);
                      //             Navigator.of(context).push(
                      //               MaterialPageRoute(
                      //                 builder: (context) => const TabBarWidget(),
                      //               ),
                      //             );
                      //           });
                      //         },
                      //       ),
                      //     )),
                    ]),
                  ),
                  // const SizedBox(
                  //   height: 100,
                  // ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
