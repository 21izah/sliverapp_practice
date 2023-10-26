// ignore_for_file: unused_element, sized_box_for_whitespace, unused_import, unused_field, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../constants/data_constant.dart';
import '../riverpod_practice/verification_button.dart';
import '../riverpod_practice/withdrawal-verification.dart';
import 'create_pin_page.dart';
import 'welcomesixth_page.dart';

class VerificationCopyPage extends StatefulWidget {
  const VerificationCopyPage({super.key});

  @override
  State<VerificationCopyPage> createState() => _VerificationCopyPageState();
}

class _VerificationCopyPageState extends State<VerificationCopyPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  final _firstPinController = TextEditingController();

  final _secondPinController = TextEditingController();

  final _thirdPinController = TextEditingController();

  final _fourthPinController = TextEditingController();

  @override
  void dispose() {
    _firstPinController.dispose();
    _secondPinController.dispose();
    _thirdPinController.dispose();
    _fourthPinController.dispose();

    super.dispose();
  }

  void addPinData() {
    _firestore.collection('UserComfirmPin').doc(user!.email).set(
      {
        'First Pin': _firstPinController.text.trim(),
        'Second Pin': _secondPinController.text.trim(),
        'Third Pin': _thirdPinController.text.trim(),
        'Fourth Pin': _fourthPinController.text.trim(),
      },
      SetOptions(merge: true),
    );
  }

  void checkPin() async {
    DocumentSnapshot document2 = await FirebaseFirestore.instance
        .collection('UserComfirmPin')
        .doc(user!.email)
        .get();

    dynamic UserComfirmPin1 = document2.get('First Pin');
    dynamic UserComfirmPin2 = document2.get('Second Pin');
    dynamic UserComfirmPin3 = document2.get('Third Pin');
    dynamic UserComfirmPin4 = document2.get('Fourth Pin');

    if ((_firstPinController.text.trim() == UserComfirmPin1) &&
        (_secondPinController.text.trim() == UserComfirmPin2) &&
        (_thirdPinController.text.trim() == UserComfirmPin3) &&
        (_fourthPinController.text.trim() == UserComfirmPin4)) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 400,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: 200,
                width: 200,
                child: Image.asset(
                  'lib/assets/success.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Success!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ]),
          );
        },
      );
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pop(context);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const SixthPage(),
            ),
            (route) => false);
      });
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 400,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // SizedBox(
              //   height: 20,
              // ),
              Container(
                height: 200,
                width: 200,
                child: Image.asset(
                  'lib/assets/warning.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Error Incorrect Pin!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ]),
          );
        },
      );
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          const Center(
            child: Text(
              'Verification',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              'Please input your pin',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          content(),
          Consumer<WithrawalVerification>(
            builder: (context, mike, _) => GestureDetector(
              onTap: () => mike.isLoading
                  ? null
                  : mike.simulateVerification(
                      firstPin: _firstPinController.text.trim(),
                      secondPin: _secondPinController.text.trim(),
                      thirdPin: _thirdPinController.text.trim(),
                      fourthPin: _fourthPinController.text.trim(),
                    ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: Container(
                  height: 60,
                  width: 400,

                  // color: Colors.amber,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.orangeAccent),
                    borderRadius: BorderRadius.circular(5),
                    color: mike.isLoading ? Colors.grey : primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mike.isLoading
                          ? Center(
                              child: Container(
                                height: 10,
                                width: 10,
                                child: CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(whiteColor),
                                  backgroundColor: Colors.black,
                                  strokeWidth: 5,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          : Text(
                              mike.isLoading ? '' : '',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          mike.isLoading ? 'Verifying' : 'Verify',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget content() {
    return Form(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          height: 60,
          width: 60,
          child: TextFormField(
            obscureText: true,
            controller: _firstPinController,
            cursorColor: Colors.deepOrange,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                // hintText: 'O',
                filled: true,
                fillColor: Theme.of(context).colorScheme.secondary,
                focusColor: Colors.green,
                border: OutlineInputBorder(

                    // borderSide: const BorderSide(color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(10))),
            style: TextStyle(color: primaryColor),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        SizedBox(
          height: 60,
          width: 60,
          child: TextFormField(
            obscureText: true,
            controller: _secondPinController,
            cursorColor: Colors.deepOrange,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              } else if (value.length == 0) {
                FocusScope.of(context).previousFocus();
              }
            },
            decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                filled: true,
                fillColor: Theme.of(context).colorScheme.secondary,
                focusColor: Colors.green,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
            style: TextStyle(color: primaryColor),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          height: 60,
          width: 60,
          child: TextFormField(
            obscureText: true,
            controller: _thirdPinController,
            cursorColor: Colors.deepOrange,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              } else if (value.length == 0) {
                FocusScope.of(context).previousFocus();
              }
            },
            decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                // hintText: 'O',
                filled: true,
                fillColor: Theme.of(context).colorScheme.secondary,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
            style: TextStyle(color: primaryColor),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          height: 60,
          width: 60,
          child: TextFormField(
            obscureText: true,
            controller: _fourthPinController,
            cursorColor: Colors.deepOrange,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).unfocus();
              } else if (value.length == 0) {
                FocusScope.of(context).previousFocus();
              }
            },
            decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                // hintText: 'O',
                filled: true,
                fillColor: Theme.of(context).colorScheme.secondary,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
            style: TextStyle(color: primaryColor),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
      ]),
    );
  }
}
