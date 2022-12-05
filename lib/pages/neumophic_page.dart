import 'package:flutter/material.dart';

class NeumophicPage extends StatefulWidget {
  const NeumophicPage({Key? key}) : super(key: key);

  @override
  State<NeumophicPage> createState() => _NeumophicPageState();
}

class _NeumophicPageState extends State<NeumophicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(90, 0, 90, 0),
            height: 50,
            width: 150,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade600,
                      offset: const Offset(3, 3),
                      blurRadius: 15,
                      spreadRadius: 2),
                  const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-3, -3),
                      blurRadius: 10,
                      spreadRadius: 2),
                ],
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20)),
            child: const Center(child: Text('BUY')),
          ),
        ],
      ),
    );
  }
}
