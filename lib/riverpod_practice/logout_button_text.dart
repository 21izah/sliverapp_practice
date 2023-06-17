// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/loginpage.dart';
import '../pages/sign_in_homepage.dart';

class LogOutButton with ChangeNotifier {
  /// setters
  bool isLoading = false;
  // to track the loading

  bool isTaskComplete = false;
  // to track the task...

  // track the error message, it determines what message to be shown
  String message = '';

  Future simulateLogOut() async {
    isLoading = true;
    notifyListeners();
    void showMessage(String message) {
      Get.bottomSheet(
        Container(
          height: 400,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 200,
              width: double.maxFinite,
              child: Image.asset(
                'lib/assets/disappointment.png',
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
      Future.delayed(Duration(seconds: 3), () {
        Get.back();
      });
    }

    try {
      showMessage('Hope to have you back Investor');
      Future.delayed(Duration(seconds: 5), () {
        FirebaseAuth.instance.signOut();
        isLoading = false;
        notifyListeners();
        Get.off(() => SignInPage());
      });
    } finally {}
  }
}
