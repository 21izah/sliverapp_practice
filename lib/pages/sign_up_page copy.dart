// ignore_for_file: avoid_unnecessary_containers, must_call_super, depend_on_referenced_packages, use_build_context_synchronously, unused_import, unused_field

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

import '../riverpod_practice/sign_up_provider.dart';
import 'create_pin_page.dart';
import 'loginpage.dart';
import '../constants/data_constant.dart';
import 'sign_in_homepage.dart';
import 'package:provider/provider.dart';

class SignUPpage2 extends StatefulWidget {
  const SignUPpage2({Key? key}) : super(key: key);

  @override
  State<SignUPpage2> createState() => _SignUPpage2State();
}

class _SignUPpage2State extends State<SignUPpage2> {
  final _formKey = GlobalKey<FormState>();
  int selectedIndex = 1;
  bool isChecked = false;
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
                height: screenSize.height * 0.25,
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
                        margin: EdgeInsets.only(
                          top: screenSize.height * 0.020,
                        ),
                        child: Text(
                          'Welcome'.tr,
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
                          "Let's Know you better".tr,
                          style: TextStyle(fontSize: 15, color: whiteColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: screenSize.height * 0.75,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenSize.height * 0.04,
                        ),
                        SizedBox(
                          height: screenSize.height * 0.01,
                        ),
                        Container(
                          padding: const EdgeInsets.all(1.0),
                          margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'First Name is required'.tr;
                              }
                              return null;
                            },
                            style: TextStyle(color: primaryColor),
                            cursorColor: primaryColor,
                            keyboardType: TextInputType.emailAddress,
                            controller: _firstnameController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(
                                  screenSize.height * 0.01,
                                ),
                                hintText: 'First Name'.tr,
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenSize.width * 0.03),
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),

                        // Container(
                        //   height: screenSize.height * 0.05,
                        //   margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        //   child: TextFormField(
                        //     cursorColor: primaryColor,
                        //     style: TextStyle(color: primaryColor),
                        //     controller: _firstnameController,
                        //     decoration: InputDecoration(
                        //         hintText: 'First Name',
                        //         hintStyle: TextStyle(
                        //             color: blackColor,
                        //             fontSize: screenSize.width * 0.03),
                        //         filled: true,
                        //         fillColor: Colors.grey[200],
                        //         border: OutlineInputBorder(
                        //             borderSide: BorderSide.none,
                        //             borderRadius: BorderRadius.circular(10))),
                        //   ),
                        // ),
                        Container(
                          padding: const EdgeInsets.all(1.0),
                          margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Surname is required'.tr;
                              }
                              return null;
                            },
                            style: TextStyle(color: primaryColor),
                            cursorColor: primaryColor,
                            keyboardType: TextInputType.emailAddress,
                            controller: _surnameController,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.all(screenSize.height * 0.01),
                                hintText: 'Surname'.tr,
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenSize.width * 0.03),
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        // Container(
                        //   height: screenSize.height * 0.05,
                        //   margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        //   child: TextFormField(
                        //     style: TextStyle(color: primaryColor),
                        //     cursorColor: primaryColor,
                        //     controller: _surnameController,
                        //     decoration: InputDecoration(
                        //         hintText: 'Surname',
                        //         hintStyle: TextStyle(
                        //             color: blackColor,
                        //             fontSize: screenSize.width * 0.03),
                        //         filled: true,
                        //         fillColor: Colors.grey[200],
                        //         border: OutlineInputBorder(
                        //             borderSide: BorderSide.none,
                        //             borderRadius: BorderRadius.circular(10))),
                        //   ),
                        // ),

                        Container(
                          padding: const EdgeInsets.all(1.0),
                          margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required'.tr;
                              }
                              return null;
                            },
                            style: TextStyle(color: Colors.blue),
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.all(screenSize.height * 0.01),
                                hintText: 'Email'.tr,
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenSize.width * 0.03),
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(1.0),
                          margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required'.tr;
                              }
                              return null;
                            },
                            style: TextStyle(color: primaryColor),
                            cursorColor: primaryColor,
                            controller: _passwordController,
                            obscureText: passwordObscured,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.all(screenSize.height * 0.01),
                                suffixIcon: IconButton(
                                  onPressed: (() => setState(() {
                                        passwordObscured = !passwordObscured;
                                      })),
                                  icon: Icon(
                                      passwordObscured
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: primaryColor),
                                ),
                                hintText: 'Choose Password'.tr,
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenSize.width * 0.03),
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(1.0),
                          margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Comfirm Password is required'.tr;
                              }
                              return null;
                            },
                            style: TextStyle(color: primaryColor),
                            controller: _comfirmpasswordController,
                            obscureText: passwordObscured,
                            cursorColor: primaryColor,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.all(screenSize.height * 0.01),
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
                                hintText: 'Comfirm Password'.tr,
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenSize.width * 0.03),
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          // color: Colors.amber,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Checkbox.adaptive(
                                      value: isChecked,
                                      onChanged: (value) {
                                        setState(() {
                                          isChecked = !isChecked;
                                        });
                                      },
                                    ),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Click to accept Cza's ".tr,
                                                style: TextStyle(
                                                  fontSize:
                                                      screenSize.height * 0.015,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () =>
                                                    Navigator.of(context).push(
                                                  PageTransition(
                                                    child: TermsAndCondition(),
                                                    type: PageTransitionType
                                                        .rightToLeft,
                                                  ),
                                                ),
                                                child: Text(
                                                  "Terms and Service".tr,
                                                  style: TextStyle(
                                                      fontSize:
                                                          screenSize.height *
                                                              0.015,
                                                      color: Colors.orange),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ]),
                                  ],
                                ),
                                SizedBox(
                                  height: screenSize.height * 0.005,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Consumer<SignUPpage2Provider>(
                          builder: (context, SignUpProvider, child) =>
                              GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                // _login();
                                SignUpProvider.isLoading
                                    ? null
                                    : SignUpProvider.simulateSignUp(
                                        email: _emailController.text.trim(),
                                        password:
                                            _passwordController.text.trim(),
                                        comfirmPassword:
                                            _comfirmpasswordController.text
                                                .trim(),
                                        firstname:
                                            _firstnameController.text.trim(),
                                        othername:
                                            _othernameController.text.trim(),
                                        surname: _surnameController.text.trim(),
                                        phoneNumber:
                                            _phoneNumberController.text.trim(),
                                        btcWallet:
                                            _btcWalletController.text.trim(),
                                        ethereumWallet:
                                            _ethereumWalletController.text
                                                .trim(),
                                        usdtTrc20Wallet:
                                            _usdtTrc20WalletController.text
                                                .trim(),
                                        usdtBep20:
                                            _usdtBep20Controller.text.trim(),
                                        usdtPolygon:
                                            _usdtPolygonController.text.trim(),
                                        usdtSolana:
                                            _usdtSolanaController.text.trim(),
                                        busdBep20:
                                            _busdBep20Controller.text.trim(),
                                        busdPolygon:
                                            _busdPolygonController.text.trim());
                              }
                            },
                            child: Container(
                              height: screenSize.height * 0.06,
                              margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                              padding:
                                  const EdgeInsets.fromLTRB(20, 15, 20, 15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // height: 50,
                              // margin: const EdgeInsets.fromLTRB(80, 0, 90, 0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SignUpProvider.isLoading
                                        ? Container(
                                            height: 10,
                                            width: 10,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                      whiteColor),
                                              backgroundColor: Colors.black,
                                              strokeWidth: 5,
                                              color: Colors.black,
                                            ),
                                          )
                                        : Text(
                                            SignUpProvider.isLoading ? '' : '',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        SignUpProvider.isLoading
                                            ? 'Please wait'.tr
                                            : 'SIGN UP'.tr,
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
                          height: 50,
                        ),
                      ]),
                ),
              ),
            ],
          ),
          Positioned(
            top: screenSize.height * 0.21,
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
                          'SIGN IN'.tr,
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
                        'SIGN UP'.tr,
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
