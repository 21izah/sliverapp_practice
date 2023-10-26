// import 'package:animated_snack_bar/animated_snack_bar.dart';
// ignore_for_file: unused_local_variable, unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../constants/data_constant.dart';
import '../data/api_calls/jsonProvider.dart';
import '../pages/create_pin_page.dart';
import '../pages/welcomesixth_page.dart';
// import '../constants/routers.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'notification_service.dart';

class SignUPpage2Provider with ChangeNotifier {
  // final BuildContext context;
  // SignUPpage2Provider(this.context);

  // base Url if needed

  /// setters
  //track the loading state, it controls when data is to be called and when text is to change
  bool isLoading = false;

  // track the task Process
  bool isTaskComplete = false;

// track the error message, it determines what message to be shown
  String message = '';

  // getters

  // bool get _isLoading => _isLoading;
  // String get _notificationMessage => notificationMessage;

  // task functions
  static final notifications = NotificationService();

  Future simulateSignUp({
    required String email,
    required String password,
    required String comfirmPassword,
    required String firstname,
    required String othername,
    required String surname,
    required String phoneNumber,
    required String btcWallet,
    required String ethereumWallet,
    required String usdtTrc20Wallet,
    required String usdtBep20,
    required String usdtPolygon,
    required String usdtSolana,
    required String busdBep20,
    required String busdPolygon,
    BuildContext? context,
  }) async {
    // show circular progress indicator
    isLoading = true;
    notifyListeners();

    await ApiProvider().getEthPrice();
    await ApiProvider().getTeams();

    //
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
        // Navigator.pop(context!);
        // PageNavigator(ctx: context).nextPageOnly(page: const SixthPage());
        Get.back();
        Get.off(() => CreatePinScreen());
      });
    }

    User? user = FirebaseAuth.instance.currentUser;
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      if (password == comfirmPassword) {
        // create user
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);

        _firestore.collection('Users').doc(userCredential.user!.uid).set(
          {
            'First Name': firstname,
            'Other Name': othername,
            'Surname': surname,
            'Email': email,
            'Phone Number': phoneNumber,
            'BTC Wallet Address': btcWallet,
            'Ethereum Wallet Address': ethereumWallet,
            'USDT TRC-20 Wallet Address': usdtTrc20Wallet,
            'USDT BEP-20 Wallet Address': usdtBep20,
            'USDT Polygon Wallet Address': usdtPolygon,
            'USDT Solana Wallet Address': usdtSolana,
            'BUSD BEP-20 WAllet Address': busdBep20,
            'BUSD Polygon Wallet Address': busdPolygon,
            'Uid': userCredential.user!.uid,
          },
          // SetOptions(merge: true),
        );

        FirebaseFirestore.instance.collection('rates').doc('rates').set({
          'Buy Rate': 750,
          'Sell Rate': 750,
        });

        User? user = FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance
            .collection('transaction')
            .doc(user!.email)
            .set(
          {
            'successfulTransaction': [],
            'decliedTransaction': [],
            'ProcessingTransaction': [],
          },
          SetOptions(merge: true),
        );
        await notifications.requestPermission();
        await notifications.getToken();

        Get.off(() => CreatePinScreen());
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
        showErrorMessage("Password don't match");
        notifyListeners();
      }
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      notifyListeners();
      showErrorMessage(e.code);
      notifyListeners();
    }
  }
}
