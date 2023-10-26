// ignore_for_file: prefer_typing_uninitialized_variables, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../constants/data_constant.dart';
import '../pages/fund_account_page.dart';
import '../pages/verification_page copy.dart';
import '../riverpod_practice/accuont_balance.dart';
import '../riverpod_practice/balance_obscure_provider.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CardDetails extends StatefulWidget {
  final double cardBalance;
  final int cardNumber;
  final int cardExpiryMonth;
  final int cardExpiryYear;
  final cardColor;
  final cardImage;
  CardDetails({
    Key? key,
    required this.cardBalance,
    required this.cardNumber,
    required this.cardExpiryMonth,
    required this.cardExpiryYear,
    required this.cardColor,
    required this.cardImage,
  }) : super(key: key);

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  final _btcController = TextEditingController();

  final _btcwalletController = TextEditingController();

  TextEditingController _nairaController = TextEditingController();

  final _passwordController = TextEditingController();

  final _username = Hive.box('username');

  @override
  void dispose() {
    _btcwalletController.dispose();
    _passwordController.dispose();
    _btcController.dispose();
    _nairaController.dispose();
    super.dispose();
  }

  substactAmount() {}

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    User? user = FirebaseAuth.instance.currentUser;

    final provider = Provider.of<BalanceObscureProvider>(context);

    Future showErrorMessage(String message) async {
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
                  'lib/assets/warning.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                message,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
      Future.delayed(Duration(seconds: 2), () {
        Get.back();
      });
    }

    withdraw() {
      // show bottom sheet
      Get.bottomSheet(
        Container(
          height: screenSize.height * 0.4,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    double? number = double.tryParse(value);
                    if (number != null) {
                      _nairaController.text =
                          ((number / _username.get(14)) * (_username.get(14)))
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
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintStyle: TextStyle(
                        color: primaryColor, fontSize: screenSize.width * 0.03),
                    hintText: 'Input Amount In USD',
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primary,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
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
                      suffixText: "USDT",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: TextStyle(
                          color: primaryColor,
                          fontSize: screenSize.width * 0.03),
                      hintText: 'YOU GET ',
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.primary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (Provider.of<AccountBalance>(context, listen: false)
                          .accountBalance <=
                      0) {
                    showErrorMessage('Insufficient Balance');
                  }

                  // else if (Provider.of<AccountBalance>(context, listen: false)
                  //         .accountBalance <
                  //     0) {
                  //   Provider.of<AccountBalance>(context, listen: false)
                  //           .accountBalance ==
                  //       0;
                  // }

                  else if (Provider.of<AccountBalance>(context, listen: false)
                          .accountBalance >
                      double.parse(_nairaController.text)) {
                    // Navigator.of(context).push(
                    //   PageTransition(
                    //     child: VerificationCopyPage(),
                    //     type: PageTransitionType.rightToLeft,
                    //   ),
                    // );

                    double amount = double.tryParse(_nairaController.text) ?? 0;
                    Provider.of<AccountBalance>(context, listen: false)
                        .substractAmount(amount);
                    _nairaController.clear();
                    _btcController.clear();
                  } else {
                    showErrorMessage('Insufficient Balance');
                  }
                },
                child: Consumer<AccountBalance>(
                  builder: (context, acct, child) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepOrange),
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Center(
                        child: const Text(
                      "Continue",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).colorScheme.primary,
      ),
      height: screenSize.height * 0.20,
      width: screenSize.width,
      child: Column(
        children: [
          const SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: screenSize.height * 0.020,
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        speed: const Duration(milliseconds: 50),
                        'Balance'.tr,
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                    ],
                  ),
                  Consumer<BalanceObscureProvider>(
                    builder: (context, ki, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ki.passwordObscured
                            ? Text(
                                '\$${widget.cardBalance}',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                              )
                            : Text(
                                '***********',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                              ),
                        GestureDetector(
                          onTap: () => ki.obscure(),
                          child: ki.passwordObscured
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.visibility,
                                    color: Colors.deepOrange,
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    size: 25,
                                    Icons.visibility_off,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.010,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(PageTransition(
                            child: FundAccountPage(),
                            type: PageTransitionType.bottomToTop,
                          ));
                        },
                        child: Container(
                          child: Center(
                              child: Text(
                            'Fund Account'.tr,
                            style: TextStyle(
                              fontSize: screenSize.height * 0.02,
                              color: Colors.white,
                            ),
                          )),
                          height: screenSize.height * 0.05,
                          width: screenSize.height * 0.15,
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          withdraw();
                          // Navigator.of(context).push(PageTransition(
                          //   child: FundAccountPage(),
                          //   type: PageTransitionType.bottomToTop,
                          // ));
                        },
                        child: Container(
                          child: Center(
                              child: Text(
                            'Withdraw'.tr,
                            style: TextStyle(
                              fontSize: screenSize.height * 0.02,
                              color: Colors.white,
                            ),
                          )),
                          height: screenSize.height * 0.05,
                          width: screenSize.height * 0.15,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
