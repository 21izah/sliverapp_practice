// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sliverapp_practice/constants/data_constant.dart';

class DeclinedTabPage extends StatefulWidget {
  const DeclinedTabPage({Key? key}) : super(key: key);

  @override
  State<DeclinedTabPage> createState() => _DeclinedTabPageState();
}

class _DeclinedTabPageState extends State<DeclinedTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // appBar: AppBar(
      //   backgroundColor: Colors.pink,
      // ),
      body: ListView(
        children: [
          TransactionContainer(),
          TransactionContainer(),
        ],
      ),
    );
  }

  Widget TransactionContainer() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(2, 10, 70, 5),
              child: Column(
                children: const [
                  Text(
                    'Declined',
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '01/01/2023',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              // padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
              // child: Text('hello'),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        '# 54,000',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
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
