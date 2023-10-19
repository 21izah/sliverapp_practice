// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sliverapp_practice/pages/buy_page2.dart';
import 'package:sliverapp_practice/pages/sell_information_page.dart';
import '../constants/data_constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../widgets/popup_menu_button.dart';
import 'account_requirement_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SellPage2 extends StatefulWidget {
  const SellPage2({super.key});

  @override
  State<SellPage2> createState() => _SellPage2State();
}

class _SellPage2State extends State<SellPage2> {
  Future getTeams() async {
    var url =
        'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    var jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
    print(jsonData);
    var jsonbit1 = jsonData['bitcoin']['usd'];
    await jsonbit1;

    _username.put(14, jsonData['bitcoin']['usd']);
    print(jsonData['bitcoin']['usd']);
    print(_username.get(14).toString());

    if (response.statusCode == 200) {
      return jsonData;
    } else {
      throw Exception('Failed to load Api Data');
    }
  }

  Future _handleRefresh() async {
    return Future.delayed(const Duration(seconds: 2));
  }

  final _btcwalletController = TextEditingController();
  final _passwordController = TextEditingController();
  final _btcController = TextEditingController();
  final _nairaController = TextEditingController();
  @override
  void dispose() {
    _btcwalletController.dispose();
    _passwordController.dispose();
    _btcController.dispose();
    _nairaController.dispose();
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
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.transparent,
                        child: Lottie.asset('lib/assets/bitcoin.json',
                            fit: BoxFit.fill),
                      ),
                    ),
                    height: screenSize.height * 0.2,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(70),
                      ),
                    ),
                    // child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center, children: []),
                  ),
                  Container(
                    height: screenSize.height * 0.65,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                        // topRight: Radius.circular(40),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 70,
                                  ),

                                  StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection('rates')
                                          .doc('rates')
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          final userData = snapshot.data!.data()
                                              as Map<String, dynamic>;

                                          return Text(
                                            'Rate: ${userData['Sell Rate']}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.deepOrange),
                                          );
                                        } else if (snapshot.hasError) {
                                          return Text('${snapshot.error}');
                                        } else {
                                          return CircularProgressIndicator();
                                        }
                                      }),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 20),
                                        child: const Text(
                                          'YOU PAY',
                                          style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),

                                  // InputAmountTextfield(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                      top: 5,
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        double? number = double.tryParse(value);
                                        if (number != null) {
                                          _passwordController.text =
                                              ((number * _username.get(16)) /
                                                      _username.get(14))
                                                  .toStringAsFixed(0)
                                                  .toString();

                                          _nairaController.text =
                                              (number / _username.get(14))
                                                  .toString();
                                        } else {
                                          _nairaController.text = '';
                                        }
                                      },
                                      controller: _btcController,
                                      style: TextStyle(
                                        color: primaryColor,
                                      ),
                                      cursorColor: Colors.deepOrange,
                                      decoration: InputDecoration(
                                        suffixText: "USD",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintStyle: TextStyle(
                                            color: primaryColor,
                                            fontSize: screenSize.width * 0.03),
                                        hintText: 'Input Amount In USD',
                                        filled: true,
                                        fillColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
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
                                          'YOU GET',
                                          style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),

                                  // YouGetTextfield(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                      top: 5,
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      readOnly: true,
                                      // onChanged: (value) {},
                                      controller: _nairaController,
                                      style: TextStyle(
                                        color: primaryColor,
                                      ),
                                      cursorColor: Colors.deepOrange,
                                      decoration: InputDecoration(
                                          suffixText: "BTC",
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          hintStyle: TextStyle(
                                              color: primaryColor,
                                              fontSize:
                                                  screenSize.width * 0.03),
                                          hintText: 'YOU GET ',
                                          filled: true,
                                          fillColor: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                      top: 5,
                                      bottom: 10,
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      readOnly: true,
                                      // onChanged: (value) {},
                                      controller: _passwordController,
                                      style: TextStyle(
                                        color: primaryColor,
                                      ),
                                      cursorColor: Colors.deepOrange,
                                      decoration: InputDecoration(
                                          suffixText: "NGN",
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          hintStyle: TextStyle(
                                              color: primaryColor,
                                              fontSize:
                                                  screenSize.width * 0.03),
                                          hintText: 'YOU GET ',
                                          filled: true,
                                          fillColor: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 20),
                                        child: const Text(
                                          'Your BTC Wallet Address',
                                          style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),

                                  // YouGetTextfield(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                      top: 5,
                                      bottom: 20,
                                    ),
                                    child: FutureBuilder<DocumentSnapshot>(
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
                                          return TextFormField(
                                            keyboardType: TextInputType.number,
                                            readOnly: true,
                                            // onChanged: (value) {},
                                            controller: _btcwalletController,
                                            cursorColor: Colors.deepOrange,
                                            decoration: InputDecoration(
                                                suffixText: "BTC",
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                hintStyle: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: screenSize.width *
                                                        0.03),
                                                hintText:
                                                    '${data['BTC Wallet Address']}',
                                                filled: true,
                                                fillColor: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.grey,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                )),
                                          );
                                        } else {
                                          return TextFormField(
                                            keyboardType: TextInputType.number,
                                            readOnly: true,
                                            // onChanged: (value) {},
                                            controller: _btcwalletController,
                                            cursorColor: Colors.deepOrange,
                                            decoration: InputDecoration(
                                                suffixText: "BTC",
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                hintStyle: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: screenSize.width *
                                                        0.03),
                                                hintText: 'BTC Wallet Address',
                                                filled: true,
                                                fillColor: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.grey,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                )),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const SizedBox(
                          //   width: 20,
                          // ),
                          // const SizedBox(
                          //   width: 20,
                          // ),
                          Container(
                            height: 40,
                            width: screenSize.width - 60,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  PageTransition(
                                    child: SellInformationPage(
                                        youGetNairaAmount:
                                            _passwordController.text.trim(),
                                        youGetAmount: _nairaController.text.trim(),
                                        ),
                                    type: PageTransitionType.rightToLeft,
                                  ),
                                );
                              },
                              child: Center(
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          // const SizedBox(
                          //   width: 20,
                          // ),
                        ],
                      ),

                      // const SizedBox(
                      //   height: 90,
                      // ),
                    ]),
                  ),
                ],
              ),
              Positioned(
                left: screenSize.width * 0.65,
                top: screenSize.height * 0.17,
                child: Container(
                  // color: Colors.amber,
                  child: Center(
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(10),
                      child: Row(children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              PageTransition(
                                child: BuyPage2(),
                                type: PageTransitionType.fade,
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(10))),
                            child: Text(
                              'BUY',
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(10))),
                          child: Text(
                            'SELL',
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
