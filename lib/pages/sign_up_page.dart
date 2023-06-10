// ignore_for_file: avoid_unnecessary_containers, must_call_super, depend_on_referenced_packages, use_build_context_synchronously, unused_import

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sliverapp_practice/pages/terms_and_condition.dart';
import 'package:sliverapp_practice/pages/welcomesixth_page.dart';
import 'package:sliverapp_practice/widgets/hidden_drawer.dart';

import 'create_pin_page.dart';
import 'loginpage.dart';
import '../constants/data_constant.dart';
import 'sign_in_homepage.dart';

class SignUPpage extends StatefulWidget {
  const SignUPpage({Key? key}) : super(key: key);

  @override
  State<SignUPpage> createState() => _SignUPpageState();
}

class _SignUPpageState extends State<SignUPpage> {
  int selectedIndex = 1;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final new23 = FirebaseFirestore.instance.collection('users').doc();

  bool passwordObscured = true;

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _comfirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

// sign up function
  void signUp() async {
    User? user = FirebaseAuth.instance.currentUser;

    // circular dialog
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
            backgroundColor: Colors.black,
            strokeWidth: 5,
            color: Colors.black,
          ));
        });

    try {
      if (_passwordController.text.trim() ==
          _comfirmpasswordController.text.trim()) {
        // create user
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
                email: _emailController.text.trim(),
                password: _passwordController.text.trim());

        _firestore.collection('Users').doc(userCredential.user!.email).set(
          {
            'First Name': _firstnameController.text.trim(),
            'Other Name': _othernameController.text.trim(),
            'Surname': _surnameController.text.trim(),
            'Email': _emailController.text.trim(),
            'Phone Number': _phoneNumberController.text.trim(),
            'BTC Wallet Address': _btcWalletController.text.trim(),
            'Ethereum Wallet Address': _ethereumWalletController.text.trim(),
            'USDT TRC-20 Wallet Address':
                _usdtTrc20WalletController.text.trim(),
            'USDT BEP-20 Wallet Address': _usdtBep20Controller.text.trim(),
            'USDT Polygon Wallet Address': _usdtPolygonController.text.trim(),
            'USDT Solana Wallet Address': _usdtSolanaController.text.trim(),
            'BUSD BEP-20 WAllet Address': _busdBep20Controller.text.trim(),
            'BUSD Polygon Wallet Address': _busdPolygonController.text.trim(),
            'Buy Rate': 750,
            'Sell Rate': 750,
          },
          // SetOptions(merge: true),
        );

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const CreatePinScreen(),
            ),
            (route) => false);
      } else {
        Navigator.pop(context);
        showErrorMessage("Password don't match");
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    AnimatedSnackBar(
      mobileSnackBarPosition: MobileSnackBarPosition.top,
      builder: ((context) {
        return Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 180, 22, 10),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8),
          // color: Colors.green,
          height: 60,

          width: 350,
          child: Center(
              child: Text(
            message,
            style: TextStyle(
              color: whiteColor,
            ),
          )),
        );
      }),
    ).show(context);

    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return

    //     Center(
    //       child: AlertDialog(
    //         backgroundColor: primaryColor,
    //         title: Center(
    //           child: Text(
    //             message,
    //             style: const TextStyle(color: Colors.white),
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  final _firstnameController = TextEditingController();

  final _othernameController = TextEditingController();

  final _surnameController = TextEditingController();

  final _usernameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  final _passwordController = TextEditingController();

  final _comfirmpasswordController = TextEditingController();

  final _btcWalletController = TextEditingController();

  final _ethereumWalletController = TextEditingController();

  final _usdtTrc20WalletController = TextEditingController();

  final _usdtBep20Controller = TextEditingController();

  final _usdtPolygonController = TextEditingController();

  final _usdtSolanaController = TextEditingController();

  final _busdBep20Controller = TextEditingController();

  final _busdPolygonController = TextEditingController();

  // final firebaseUser = FirebaseAuth.instance.currentUser;

  // final docUser = FirebaseFirestore.instance.collection('users').doc();

  @override
  void dispose() {
    _firstnameController.dispose();
    _othernameController.dispose();
    _surnameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _comfirmpasswordController.dispose();
    _btcWalletController.dispose();
    _ethereumWalletController.dispose();
    _usdtTrc20WalletController.dispose();
    _usdtBep20Controller.dispose();
    _usdtPolygonController.dispose();
    _usdtSolanaController.dispose();
    _busdBep20Controller.dispose();
    _busdPolygonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(FirebaseFirestore.instance.collection('users').doc().id);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              Container(
                height: screenSize.height * 0.3,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      // bottomRight: Radius.circular(70),
                      ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: Text(
                            'Welcome',
                            style: TextStyle(fontSize: 50, color: whiteColor),
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 0.3,
                      // ),
                      Center(
                        child: Container(
                          child: Text(
                            "Let's Know you better",
                            style: TextStyle(fontSize: 15, color: whiteColor),
                          ),
                        ),
                      ),
                    ]),
              ),
              Container(
                height: screenSize.height * 0.7,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(children: [
                        Container(
                          width: 150,
                          height: 50,
                          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextFormField(
                            cursorColor: primaryColor,
                            controller: _firstnameController,
                            decoration: InputDecoration(
                                hintText: 'First Name',
                                hintStyle: TextStyle(
                                    color: blackColor,
                                    fontSize: screenSize.width * 0.03),
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          margin: const EdgeInsets.fromLTRB(0, 5, 20, 5),
                          child: TextFormField(
                            cursorColor: primaryColor,
                            controller: _surnameController,
                            decoration: InputDecoration(
                                hintText: 'Surname',
                                hintStyle: TextStyle(
                                    color: blackColor,
                                    fontSize: screenSize.width * 0.03),
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ]),
                      Row(
                        children: [
                          Container(
                            width: 150,
                            height: 50,
                            margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: TextFormField(
                              cursorColor: primaryColor,
                              controller: _usernameController,
                              decoration: InputDecoration(
                                  hintText: 'Username',
                                  hintStyle: TextStyle(
                                      color: blackColor,
                                      fontSize: screenSize.width * 0.03),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 50,
                            margin: const EdgeInsets.fromLTRB(0, 5, 20, 5),
                            child: TextFormField(
                              cursorColor: primaryColor,
                              keyboardType: TextInputType.number,
                              controller: _phoneNumberController,
                              decoration: InputDecoration(
                                  hintText: 'Phone Number',
                                  hintStyle: TextStyle(
                                      color: blackColor,
                                      fontSize: screenSize.width * 0.03),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: TextFormField(
                          cursorColor: primaryColor,
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                  color: blackColor,
                                  fontSize: screenSize.width * 0.03),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: TextFormField(
                          cursorColor: primaryColor,
                          controller: _passwordController,
                          obscureText: passwordObscured,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: (() => setState(() {
                                      passwordObscured = !passwordObscured;
                                    })),
                                icon: Icon(
                                  passwordObscured
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: primaryColor,
                                ),
                              ),
                              hintText: 'Choose Password',
                              hintStyle: TextStyle(
                                  color: blackColor,
                                  fontSize: screenSize.width * 0.03),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: TextFormField(
                          controller: _comfirmpasswordController,
                          obscureText: passwordObscured,
                          cursorColor: primaryColor,
                          decoration: InputDecoration(
                              // floatingLabelBehavior: FloatingLabelBehavior.always,
                              // labelText: 'Comfirm Password',
                              // labelStyle: TextStyle(
                              //   color: Colors.deepOrange,
                              //   fontSize: 15,
                              //   fontWeight: FontWeight.bold,
                              // ),
                              suffixIcon: IconButton(
                                onPressed: (() => setState(() {
                                      passwordObscured = !passwordObscured;
                                    })),
                                icon: Icon(
                                  passwordObscured
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: primaryColor,
                                ),
                              ),
                              hintText: 'Comfirm Password',
                              hintStyle: TextStyle(
                                  color: blackColor,
                                  fontSize: screenSize.width * 0.03),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        "By clicking the SignUp button below you agree to \nCza's",
                                    style: TextStyle(
                                        fontSize: 15, color: whiteColor),
                                  ),
                                  TextSpan(
                                    onEnter: (event) {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const TermsAndCondition(),
                                      ));
                                    },
                                    text: " Terms and Service",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.orange),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // height: 50,
                        margin: const EdgeInsets.fromLTRB(80, 0, 90, 0),
                        child: GestureDetector(
                            onTap: signUp,
                            child: const Center(
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ]),
              ),
            ],
          ),
          Positioned(
            top: screenSize.height * 0.27,
            right: screenSize.width * 0.0585,
            child: Container(
              // color: Colors.amber,
              child: Center(
                child: Container(
                  // width: 150,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(10),
                  child: Row(children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          PageTransition(
                            child: SignInPage(),
                            type: PageTransitionType.fade,
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(10))),
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(10))),
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
