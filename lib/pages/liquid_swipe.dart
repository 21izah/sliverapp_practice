// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';

class LiquidSwipeTesting extends StatelessWidget {
  LiquidSwipeTesting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: LiquidSwipe(
        enableSideReveal: true,
        slideIconWidget: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
        pages: pages,
      ),
    );
  }

  final pages = [
    Container(
      // color: Colors.grey[900],
      //  child: AspectRatio(
      //   aspectRatio: 300 / 5,
      child: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),

              // color: Colors.deepOrange,
              height: 400,
              width: 400,
              // color: Colors.blue,

              // width: double.infinity,
              child: Lottie.asset('lib/assets/86719-cryptocurrency.json'),
            ),
            // AspectRatio(
            //   aspectRatio: 80 / 5,
            //   child:
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  'WELCOME TO CZA EXCHANGE',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            Container(
              child: Center(
                child: Column(
                  children: const [
                    Text(
                      'Hi there! Welcome to the Cza Family!',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'We are glad  to help you earn and grow your business.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),

                // Text(
                //   'Hi there! Welcome to the Cza Family! \nWe are glad  to help you earn and grow your business.',
                //   style: TextStyle(
                //     color: Colors.white,
                //   ),
                // ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    ),
    Container(
      color: Colors.grey.shade900,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.pink,
    ),
    Container(
      color: Colors.deepOrange,
    ),
  ];
}
