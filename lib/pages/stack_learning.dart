// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class StackLearning extends StatefulWidget {
  const StackLearning({Key? key}) : super(key: key);

  @override
  State<StackLearning> createState() => _StackLearningState();
}

class _StackLearningState extends State<StackLearning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              height: 300,
              width: 300,
              color: Colors.amber,
            ),
            Container(
              alignment: const Alignment(0.0002, 0),
              height: 200,
              width: 200,
              color: Colors.green,
              child: Container(
                height: 10,
                width: 10,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
