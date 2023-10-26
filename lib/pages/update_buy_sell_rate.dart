import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/data_constant.dart';

class UpdateBuySellRate extends StatefulWidget {
  const UpdateBuySellRate({super.key});

  @override
  State<UpdateBuySellRate> createState() => _UpdateBuySellRateState();
}

class _UpdateBuySellRateState extends State<UpdateBuySellRate> {
  final _updateBuyRateController = TextEditingController();
  final _updateSellRateController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  Future updateBuyRate() async {
    if (_updateSellRateController.text.trim().length > 0) {
      await FirebaseFirestore.instance
          .collection('rates')
          .get()
          .then((x) => x.docs.forEach((document) {
                FirebaseFirestore.instance
                    .collection('rates')
                    .doc('rates')
                    .update({
                  'Buy Rate': _updateBuyRateController.text.trim(),
                });
              }));

      Get.bottomSheet(
        Container(
          height: 400,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // SizedBox(
            //   height: 20,
            // ),
            Container(
              height: 200,
              width: double.maxFinite,
              child: Image.asset(
                'lib/assets/success.png',
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Buy Rate Added Successfully!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ]),
        ),
      );
      Future.delayed(Duration(seconds: 2), () {
        Get.back();
      });
    }
  }

  Future updateSellRate() async {
    if (_updateSellRateController.text.trim().length > 0) {
      await FirebaseFirestore.instance
          .collection('Users')
          .get()
          .then((x) => x.docs.forEach((document) {
                FirebaseFirestore.instance
                    .collection('rates')
                    .doc('rates')
                    .update({
                  'Sell Rate': _updateSellRateController.text.trim(),
                });
              }));
    }

    Get.bottomSheet(
      Container(
        height: 400,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // SizedBox(
          //   height: 20,
          // ),
          Container(
            height: 200,
            width: double.maxFinite,
            child: Image.asset(
              'lib/assets/success.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Sell Rate Added Successfully!',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ]),
      ),
    );
    Future.delayed(Duration(seconds: 2), () {
      Get.back();
    });
  }

  @override
  void dispose() {
    _updateBuyRateController.dispose();
    _updateSellRateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Buy Sell Rate'),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: screenSize.height * 0.05,
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: TextFormField(
            style: TextStyle(color: primaryColor),
            cursorColor: primaryColor,
            keyboardType: TextInputType.number,
            controller: _updateBuyRateController,
            decoration: InputDecoration(
                hintText: 'Update Buy Rate',
                hintStyle: TextStyle(
                    color: blackColor, fontSize: screenSize.width * 0.03),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Container(
          height: screenSize.height * 0.05,
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: TextFormField(
            style: TextStyle(color: primaryColor),
            cursorColor: primaryColor,
            keyboardType: TextInputType.number,
            controller: _updateSellRateController,
            decoration: InputDecoration(
                hintText: 'Update Sell Rate',
                hintStyle: TextStyle(
                    color: blackColor, fontSize: screenSize.width * 0.03),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        GestureDetector(
          onTap: () {
            updateBuyRate();
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepOrange),
            height: 50,
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Center(
                child: const Text(
              "Update Buy Rate",
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            updateSellRate();
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepOrange),
            height: 50,
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Center(
                child: const Text(
              "Update Sell Rate",
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
      ]),
    );
  }
}
