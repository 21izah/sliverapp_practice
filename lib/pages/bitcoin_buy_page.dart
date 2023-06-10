// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:sliverapp_practice/containers/card_details.dart';
import 'package:sliverapp_practice/containers/coinBuySell.dart';
import 'package:sliverapp_practice/pages/buy_page.dart';
import 'package:sliverapp_practice/pages/sell_page.dart';

class BitcoinBuyPage extends StatelessWidget {
  const BitcoinBuyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        children: [
          CardDetails(
            cardColor: Colors.deepOrange,
            cardBalance: 455656.00,
            cardNumber: 2355,
            cardExpiryMonth: 23,
            cardExpiryYear: 20,
            cardImage: Image.asset('lib/assets/bitcoin_cash.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BuyPage(),
                  )),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.green,
                              blurRadius: 15,
                              offset: Offset(5, 5),
                              spreadRadius: 1),
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 15,
                              offset: Offset(-5, -5),
                              spreadRadius: 1),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: const Text(
                      "BUY",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SellPage(),
                  )),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.red,
                              blurRadius: 15,
                              offset: Offset(5, 5),
                              spreadRadius: 1),
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 15,
                              offset: Offset(-5, -5),
                              spreadRadius: 1),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: const Text(
                      "SELL",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CoinBuySell(
              coinName: 'Ethereum',
              gradientColor: const Color.fromARGB(221, 41, 37, 37),
              coinImage: Image.asset('lib/assets/Ethereum_.png')),
          CoinBuySell(
              coinName: 'USDT',
              gradientColor: const Color.fromARGB(255, 20, 141, 63),
              coinImage: Image.asset('lib/assets/usdt_.png')),
          CoinBuySell(
              coinName: 'BUSD',
              gradientColor: Colors.yellow,
              coinImage: Image.asset('lib/assets/busd1_.png')),
          CoinBuySell(
              coinName: 'Other Crypto',
              gradientColor: Colors.deepPurple,
              coinImage: Image.asset('lib/assets/dash.png')),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
