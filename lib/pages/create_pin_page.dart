// ignore_for_file: unused_element, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../constants/data_constant.dart';
import '../riverpod_practice/create_pin_provider.dart';
import 'comfirm_pin_page.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({super.key});

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey,
            title: Container(
              height: 100,
              width: 100,
              child: Image.asset(
                'lib/assets/Frame4.png',
                // fit: BoxFit.contain,
              ),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                    text: '              Success!',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: '\nAccount created successfully',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ])),
              ],
            ),
          );
        });
  }

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
    _firestore.collection('UserPin').doc(user!.email).set(
      {
        'First Pin': _firstPinController.text.trim(),
        'Second Pin': _secondPinController.text.trim(),
        'Third Pin': _thirdPinController.text.trim(),
        'Fourth Pin': _fourthPinController.text.trim(),
      },
      // SetOptions(merge: true),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          Consumer<CreatePinProvider>(
            builder: (context, as, child) => GestureDetector(
              onTap: () => as.isLoading
                  ? null
                  : as.addPinData(
                      firstPin: _firstPinController.text.trim(),
                      secondPin: _secondPinController.text.trim(),
                      thirdPin: _thirdPinController.text.trim(),
                      fourthPin: _fourthPinController.text.trim(),
                    ),
              // addPinData();

              // showModalBottomSheet(
              //   context: context,
              //   builder: (context) {
              //     return Container(
              //       height: 400,
              //       decoration: const BoxDecoration(
              //           color: Colors.white,
              //           borderRadius:
              //               BorderRadius.vertical(top: Radius.circular(20))),
              //       child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             // SizedBox(
              //             //   height: 20,
              //             // ),
              //             Container(
              //               height: 200,
              //               width: 200,
              //               child: Image.asset(
              //                 'lib/assets/success.png',
              //                 fit: BoxFit.scaleDown,
              //               ),
              //             ),
              //             const SizedBox(
              //               height: 10,
              //             ),
              //             const Text(
              //               'Success!',
              //               style: TextStyle(
              //                   fontSize: 25, fontWeight: FontWeight.bold),
              //             ),
              //           ]),
              //     );
              //   },
              // );
              // Future.delayed(Duration(seconds: 2), () {
              //   Navigator.pop(context);
              //   Navigator.of(context).pushAndRemoveUntil(
              //       MaterialPageRoute(
              //         builder: (context) => const ComfirmPinPage(),
              //       ),
              //       (route) => false);
              // });

              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.deepOrange,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      as.isLoading
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
                              as.isLoading ? '' : '',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          as.isLoading ? 'Verifying' : 'Verify',
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
                fillColor: Colors.grey[200],
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
                fillColor: Colors.grey[200],
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
                fillColor: Colors.grey[200],
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
                fillColor: Colors.grey[200],
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
