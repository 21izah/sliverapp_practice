// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class SuccesfulTabPage extends StatefulWidget {
  const SuccesfulTabPage({Key? key}) : super(key: key);

  @override
  State<SuccesfulTabPage> createState() => _SuccesfulTabPageState();
}

class _SuccesfulTabPageState extends State<SuccesfulTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      // appBar: AppBar(
      //   backgroundColor: Colors.pink,
      // ),
      body: ListView(
        children: [
          TransactionContainer(),
        ],
      ),
    );
  }

  Widget TransactionContainer() {
    return Container(
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: Colors.deepOrange,
          blurRadius: 15,
          offset: Offset(5, 5),
          spreadRadius: 2,
        ),
        BoxShadow(
          color: Colors.deepOrange,
          blurRadius: 15,
          offset: Offset(-10, -10),
          spreadRadius: 2,
        ),
      ], color: Colors.black, borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.fromLTRB(20, 50, 20, 10),
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: const CircleAvatar(
                backgroundColor: Colors.deepOrange,
                child: Text('\$'),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(2, 10, 70, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Withdrawal',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Date',
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
                        '#',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Amount',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const Text(
                    'Successful',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
