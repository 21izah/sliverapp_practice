// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import '../constants/data_constant.dart';

class ProcessingTabPage extends StatefulWidget {
  const ProcessingTabPage({Key? key}) : super(key: key);

  @override
  State<ProcessingTabPage> createState() => _ProcessingTabPageState();
}

class _ProcessingTabPageState extends State<ProcessingTabPage> {
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
        ],
      ),
    );
  }

  Widget TransactionContainer() {
    return Container(
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: Colors.blue,
          blurRadius: 15,
          offset: Offset(5, 5),
          spreadRadius: 2,
        ),
        BoxShadow(
          color: Colors.blue,
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
                backgroundColor: Colors.blue,
                child: Text('\$'),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(2, 10, 70, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Processing',
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '02/03/2023',
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
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        '5000',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
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
