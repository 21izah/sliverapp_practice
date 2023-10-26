import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/create_pin_page.dart';
import '../pages/welcomesixth_page.dart';

class ComfirmPinProvider with ChangeNotifier {
  /// setters
  bool isLoading = false;
  // to track the loading

  bool isTaskComplete = false;
  // to track the task...

  // track the error message, it determines what message to be shown
  String message = '';

  void addPinData({
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
    await _firestore.collection('UserComfirmPin').doc(user!.email).set(
      {
        'First Pin': firstPin,
        'Second Pin': secondPin,
        'Third Pin': thirdPin,
        'Fourth Pin': fourthPin,
      },
      SetOptions(merge: true),
    );

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
        Get.off(() => CreatePinScreen());
        isLoading = false;
        notifyListeners();
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
        // Navigator.pop(context!);
        // PageNavigator(ctx: context).nextPageOnly(page: const SixthPage());
        Get.back();
        Get.off(() => SixthPage());
        isLoading = false;
        notifyListeners();
      });
    }

    // User? user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot document1 = await FirebaseFirestore.instance
        .collection('UserPin')
        .doc(user.email)
        .get();
    DocumentSnapshot document2 = await FirebaseFirestore.instance
        .collection('UserComfirmPin')
        .doc(user.email)
        .get();

    dynamic UserPin1 = document1.get('First Pin');
    dynamic UserPin2 = document1.get('Second Pin');
    dynamic UserPin3 = document1.get('Third Pin');
    dynamic UserPin4 = document1.get('Fourth Pin');

    dynamic UserComfirmPin1 = document2.get('First Pin');
    dynamic UserComfirmPin2 = document2.get('Second Pin');
    dynamic UserComfirmPin3 = document2.get('Third Pin');
    dynamic UserComfirmPin4 = document2.get('Fourth Pin');

    if ((UserPin1 == UserComfirmPin1) &&
        (UserPin2 == UserComfirmPin2) &&
        (UserPin3 == UserComfirmPin3) &&
        (UserPin4 == UserComfirmPin4)) {
      showSuccessMessage('Success');
      notifyListeners();
    } else {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      User? user = FirebaseAuth.instance.currentUser;
      await _firestore.collection('UserComfirmPin').doc(user!.email).set(
        {
          'First Pin': 34343434,
          'Second Pin': 34343434,
          'Third Pin': 34343434,
          'Fourth Pin': 34343434,
        },
        SetOptions(merge: true),
      );
      showErrorMessage('Error Incorrect Pin!');
      notifyListeners();
    }
  }
}
