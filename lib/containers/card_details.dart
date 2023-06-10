// ignore_for_file: prefer_typing_uninitialized_variables, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:page_transition/page_transition.dart';
import '../constants/data_constant.dart';
import '../pages/fund_account_page.dart';

class CardDetails extends StatelessWidget {
  final double cardBalance;
  final int cardNumber;
  final int cardExpiryMonth;
  final int cardExpiryYear;
  final cardColor;
  final cardImage;
  const CardDetails({
    Key? key,
    required this.cardBalance,
    required this.cardNumber,
    required this.cardExpiryMonth,
    required this.cardExpiryYear,
    required this.cardColor,
    required this.cardImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    User? user = FirebaseAuth.instance.currentUser;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).colorScheme.primary,
      ),
      height: screenSize.height * 0.40,
      width: screenSize.width,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 3,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     CircleAvatar(
          //         radius: 50,
          //         backgroundColor: Colors.transparent,
          //         child: cardImage),
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        speed: const Duration(milliseconds: 50),
                        'Balance',
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  Text(
                    '\$$cardBalance',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                        'Fund Account',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )),
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: AnimatedTextKit(
              //     animatedTexts: [
              //       TypewriterAnimatedText(
              //         speed: const Duration(milliseconds: 50),
              //         '****  ****   **** $cardNumber',
              //         textStyle: const TextStyle(
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
