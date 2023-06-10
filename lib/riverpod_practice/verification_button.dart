import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/api_calls/jsonProvider.dart';
import '../pages/welcomesixth_page.dart';

class VerificationButton with ChangeNotifier {
  /// setters

  // track loading state

  bool isLoading = false;

  // track notification message
  String message = '';

  // simultate task

  Future simulateVerification({
    required String firstPin,
    required String secondPin,
    required String thirdPin,
    required String fourthPin,
    BuildContext? context,
  }) async {
    isLoading = true;
    notifyListeners();

    await ApiProvider().getEthPrice();
    await ApiProvider().getTeams();

    void showErrorMessage(String message) {
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
                'lib/assets/warning.png',
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              message,
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

    void showSuccessMessage(String message) {
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
              message,
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
        Get.off(() => SixthPage());
      });
    }

    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot document2 =
        await _firestore.collection('UserComfirmPin').doc(user!.email).get();

    dynamic UserComfirmPin1 = document2.get('First Pin');
    dynamic UserComfirmPin2 = document2.get('Second Pin');
    dynamic UserComfirmPin3 = document2.get('Third Pin');
    dynamic UserComfirmPin4 = document2.get('Fourth Pin');

    if ((firstPin == UserComfirmPin1) &&
        (secondPin == UserComfirmPin2) &&
        (thirdPin == UserComfirmPin3) &&
        (fourthPin == UserComfirmPin4)) {
      showSuccessMessage('Success');
      notifyListeners();
    } else {
      isLoading = false;
      notifyListeners();
      showErrorMessage('Error Incorrect Pin!');
      notifyListeners();
    }

    void checkPin() async {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      User? user = FirebaseAuth.instance.currentUser;
      DocumentSnapshot document2 =
          await _firestore.collection('UserComfirmPin').doc(user!.email).get();

      dynamic UserComfirmPin1 = document2.get('First Pin');
      dynamic UserComfirmPin2 = document2.get('Second Pin');
      dynamic UserComfirmPin3 = document2.get('Third Pin');
      dynamic UserComfirmPin4 = document2.get('Fourth Pin');

      if ((firstPin == UserComfirmPin1) &&
          (secondPin == UserComfirmPin2) &&
          (thirdPin == UserComfirmPin3) &&
          (fourthPin == UserComfirmPin4)) {
        showSuccessMessage('Success');
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
        showErrorMessage('Error Incorrect Pin!');
        notifyListeners();
      }
    }
  }
}
