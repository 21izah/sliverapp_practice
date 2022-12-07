import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CrudTesting extends StatelessWidget {
  CrudTesting({Key? key}) : super(key: key);

  final _usdtPolygonController = TextEditingController();
  final _busdBep20Controller = TextEditingController();

  @override
  void dispose() {
    _usdtPolygonController.dispose();
    _busdBep20Controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: ListView(children: [
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: TextField(
            cursorColor: Colors.deepOrange,
            //   keyboardType: TextInputType.emailAddress,
            controller: _usdtPolygonController,
            decoration: InputDecoration(
                hintText: 'USDT Polygon Wallet Address',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: TextField(
            cursorColor: Colors.deepOrange,
            //   keyboardType: TextInputType.emailAddress,
            controller: _busdBep20Controller,
            decoration: InputDecoration(
                hintText: 'USDT Polygon Wallet Address',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: TextField(
            cursorColor: Colors.deepOrange,
            //   keyboardType: TextInputType.emailAddress,
            controller: _usdtPolygonController,
            decoration: InputDecoration(
                hintText: 'USDT Polygon Wallet Address',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.pink,
                  child: const Center(child: Text('create')),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.pink,
                  child: const Center(child: Text('read')),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.pink,
                  child: const Center(child: Text('update')),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.pink,
                  child: const Center(child: Text('delete')),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.blue.shade900,
                  child: const Center(child: Text('aefueff')),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
