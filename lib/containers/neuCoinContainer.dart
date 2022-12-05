// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class NeuCoinCardContainer extends StatelessWidget {
  final String coinName;
  final coinImage;
  const NeuCoinCardContainer({
    Key? key,
    required this.coinName,
    required this.coinImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        height: 150,
        width: 400,
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
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$coinName Trading',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Buy & Sell $coinName',
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  child: coinImage,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
