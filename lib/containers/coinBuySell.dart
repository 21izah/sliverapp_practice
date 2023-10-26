// ignore_for_file: file_names, prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'dart:ui';

import 'package:flutter/material.dart';

class CoinBuySell extends StatelessWidget {
  final String coinName;
  final coinImage;
  final gradientColor;
  const CoinBuySell({
    Key? key,
    required this.coinName,
    required this.coinImage,
    required this.gradientColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 150,
          width: 400,
          child: Stack(children: [
            // blur effect
            BackdropFilter(filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5)),

            // gradient effect

            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepOrange.shade700,
                    blurRadius: 15,
                    offset: const Offset(5, 5),
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.deepOrange.shade200,
                    blurRadius: 15,
                    offset: const Offset(-5, -5),
                    spreadRadius: 1,
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [Colors.black, Colors.deepOrange.shade400],
                  stops: const [0.1, 0.9],
                ),
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
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
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: coinImage,
                      ),
                    ],
                  ),
                )
              ]),
            ),

            // child
          ]),
        ),
      ),
    );
  }
}
