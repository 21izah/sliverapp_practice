// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

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

  // const CardDetails({

  //   keys? key,

  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 3),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepOrange,
          boxShadow: const [
            BoxShadow(
                spreadRadius: 1,
                offset: Offset(-5, -5),
                color: Colors.white,
                blurRadius: 30),
            BoxShadow(
                offset: Offset(5, 28), color: Colors.black, blurRadius: 30),
          ]),
      // color: Colors.amber,
      // height: 250,
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Balance',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$$cardBalance',
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  child: cardImage),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '****  ****   **** $cardNumber',
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            '$cardExpiryMonth/$cardExpiryYear',
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
