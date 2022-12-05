// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:sliverapp_practice/pages/curved_navigation_bar_widget.dart';
import 'package:sliverapp_practice/pages/sell_page.dart';
import 'package:sliverapp_practice/pages/buy_page.dart';

class BitcoinBuySellContainer extends StatelessWidget {
  const BitcoinBuySellContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            color: Colors.deepOrange,
            offset: Offset(10, 5),
            blurRadius: 15,
            spreadRadius: 1),
        BoxShadow(
            color: Colors.black,
            offset: Offset(-3, -3),
            blurRadius: 15,
            spreadRadius: 1),
      ], color: Colors.black, borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      padding: const EdgeInsets.fromLTRB(10, 20, 40, 20),
      // color: Colors.deepOrange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(00, 00, 00, 00),
            padding: const EdgeInsets.fromLTRB(20, 2, 20, 20),
            child: const Text(
              "Bitcoin Trading",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          IntrinsicWidth(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // SizedBox(
                //   width: 2,
                // ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  //  padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  height: 50,
                  width: 90,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.deepOrange,
                          offset: Offset(10, 5),
                          blurRadius: 15,
                          spreadRadius: 1),
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(-3, -3),
                          blurRadius: 15,
                          spreadRadius: 1),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BuyPage(),
                        ))
                      },
                      child: const Text("BUY",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40),
                  //  padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  height: 50,
                  width: 90,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.deepOrange,
                          offset: Offset(10, 5),
                          blurRadius: 15,
                          spreadRadius: 1),
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(-3, -3),
                          blurRadius: 15,
                          spreadRadius: 1),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SellPage(),
                        ))
                      },
                      child: const Text("SELL",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
