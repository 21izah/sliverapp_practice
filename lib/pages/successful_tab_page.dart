// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sliverapp_practice/constants/data_constant.dart';

import 'transaction_details_page.dart';

class SuccesfulTabPage extends StatefulWidget {
  const SuccesfulTabPage({Key? key}) : super(key: key);

  @override
  State<SuccesfulTabPage> createState() => _SuccesfulTabPageState();
}

class _SuccesfulTabPageState extends State<SuccesfulTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          TransactionContainer(),
          TransactionContainer(),
          TransactionContainer(),
          TransactionContainer(),
          TransactionContainer(),
          TransactionContainer(),
          TransactionContainer(),
          TransactionContainer(),
        ],
      ),
    );
  }

  Widget TransactionContainer() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageTransition(
            child: TransactionDetailsScreen(),
            type: PageTransitionType.rightToLeft,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          // boxShadow: const [
          //   BoxShadow(
          //     color: Colors.green,
          //     blurRadius: 5,
          //     offset: Offset(2, 2),
          //     spreadRadius: 2,
          //   ),
          //   BoxShadow(
          //     color: Colors.green,
          //     blurRadius: 5,
          //     offset: Offset(-2, -2),
          //     spreadRadius: 2,
          //   ),
          // ],
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        // padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      // boxShadow: const [
                      //   BoxShadow(
                      //     color: Colors.green,
                      //     blurRadius: 15,
                      //     offset: Offset(2, 2),
                      //     spreadRadius: 2,
                      //   ),
                      //   BoxShadow(
                      //     color: Colors.green,
                      //     blurRadius: 15,
                      //     offset: Offset(-2, -2),
                      //     spreadRadius: 2,
                      //   ),
                      // ],
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('\$'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(2, 10, 70, 10),
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Deposit',
                        style: TextStyle(color: Colors.green),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '02/03/2023',
                        style: TextStyle(color: Colors.deepOrange),
                      )
                    ],
                  ),
                  // padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                  // child: Text('hello'),
                ),
              ],
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        '#',
                        style:
                            TextStyle(color: Colors.deepOrange, fontSize: 20),
                      ),
                      Text(
                        '5000',
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      ),
                    ],
                  ),
                  Text(
                    'Successful',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
