import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/comfirm_pin_page.dart';

class CreatePinProvider with ChangeNotifier {
  /// setters
  bool isLoading = false;
  // to track the loading

  bool isTaskComplete = false;
  // to track the task...

  // track the error message, it determines what message to be shown
  String message = '';

  Future addPinData({
    required String firstPin,
    required String secondPin,
    required String thirdPin,
    required String fourthPin,
    BuildContext? context,
  }) async {
    isLoading = true;
    notifyListeners();
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;
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
        // Navigator.pop(context!);
        // PageNavigator(ctx: context).nextPageOnly(page: const SixthPage());
        Get.back();
        Get.off(() => ComfirmPinPage());
        isLoading = false;
        notifyListeners();
      });
    }

    _firestore.collection('UserPin').doc(user!.email).set(
      {
        'First Pin': firstPin,
        'Second Pin': secondPin,
        'Third Pin': thirdPin,
        'Fourth Pin': fourthPin,
      },
      // SetOptions(merge: true),
    );
    showSuccessMessage('Success');
    notifyListeners();
  }
}
