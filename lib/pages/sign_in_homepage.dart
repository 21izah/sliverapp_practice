// ignore_for_file: sized_box_for_whitespace, unused_import, sort_child_properties_last, depend_on_referenced_packages, unused_local_variable

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_snackbar/simple_snackbar.dart';
import 'package:sliverapp_practice/pages/forgot_password.dart';
import 'package:sliverapp_practice/pages/welcomesixth_page.dart';
import 'package:sliverapp_practice/pages/welcome_page.dart';
import 'package:sliverapp_practice/widgets/hidden_drawer.dart';

import 'sign_up_page copy.dart';
import 'sign_up_page.dart';
import '../constants/data_constant.dart';
import '../data/api_calls/jsonProvider.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import '../riverpod_practice/changeButton_text.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  bool passwordObscured = true;

  Future signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(primaryColor),
          backgroundColor: Colors.black,
          strokeWidth: 5,
          color: Colors.black,
        ));
      },
    );

    await ApiProvider().getEthPrice();
    await ApiProvider().getTeams();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      User? user = await FirebaseAuth.instance.currentUser;
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .get();

      if (snapshot.exists) {
        final role = await snapshot.get('USDT BEP-20 Wallet Address');

        if (role == 'admin') {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HiddenDrawer(),
              ),
              (route) => false);
          // isLoading = false;
          // notifyListeners();
        } else {
          // isLoading = false;
          // notifyListeners();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const SixthPage(),
              ),
              (route) => false);

          // showSuccessMessage('Success');
          // notifyListeners();
        }
      }
      // // .then((value) =>
      // await Future.delayed(Duration(seconds: 3));

      // AnimatedSnackBar(
      //   mobileSnackBarPosition: MobileSnackBarPosition.top,
      //   builder: ((context) {
      //     return Container(
      //       decoration: BoxDecoration(
      //         color: Colors.green,
      //         borderRadius: BorderRadius.circular(10),
      //       ),
      //       padding: const EdgeInsets.all(8),
      //       // color: Colors.green,
      //       height: 60,

      //       width: 350,
      //       child: Center(
      //           child: Text(
      //         ' Pleased To Have You Back Investor',
      //         style: TextStyle(
      //           color: whiteColor,
      //         ),
      //       )),
      //     );
      //   }),
      // ).show(context);

      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(
      //       builder: (context) => const SixthPage(),
      //     ),
      //     (route) => false);
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
  }

  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    final screenSize = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final systemPadding = MediaQuery.of(context).padding;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      backgroundColor: primaryColor,
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   foregroundColor: Colors.deepOrange,
      // ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenSize.height * 0.3,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(70),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: screenSize.width * 0.04,
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              speed: const Duration(milliseconds: 50),
                              'Welcome Back,'.tr,
                              textStyle: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.background,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(
                      //   height: 0.3,
                      // ),
                      Container(
                        margin: EdgeInsets.only(
                          left: screenSize.width * 0.040,
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              speed: const Duration(milliseconds: 50),
                              'Investor'.tr,
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.background,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: screenSize.height * 0.7,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      // topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        // AnimatedTextKit(
                        //   animatedTexts: [
                        //     TypewriterAnimatedText(
                        //       speed: const Duration(milliseconds: 50),
                        //       'Please Input Login details',
                        //       textStyle: TextStyle(
                        //         fontSize: 20,
                        //         fontWeight: FontWeight.bold,
                        //         color: Theme.of(context).colorScheme.tertiary,
                        //       ),
                        //     ),
                        //   ],
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
                            style: TextStyle(color: primaryColor),
                            cursorColor: primaryColor,
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(20),
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
                                contentPadding: EdgeInsets.all(20),
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
                                hintText: 'Password'.tr,
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
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordPage(),
                                  ));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.deepOrange),
                                  child: Center(
                                    child: Text(
                                      'Forgot password?'.tr,
                                      style: TextStyle(
                                          color: whiteColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Consumer<ChangeButtonTextProvider>(
                          builder: (context, me, _) {
                            return GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  // _login();
                                  me.isLoading
                                      ? null
                                      : me.simulateSignIn(
                                          email: _emailController.text.trim(),
                                          password:
                                              _passwordController.text.trim(),
                                        );
                                }
                              },
                              child: Container(
                                height: screenSize.height * 0.05,
                                margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    ),
                                    color: me.isLoading
                                        ? Colors.grey
                                        : primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      me.isLoading
                                          ? Center(
                                              child: Container(
                                                height: 10,
                                                width: 10,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation(
                                                          whiteColor),
                                                  backgroundColor: Colors.black,
                                                  strokeWidth: 5,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            )
                                          : Text(
                                              me.isLoading ? '' : '',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          me.isLoading
                                              ? 'Please wait'.tr
                                              : 'SIGN IN'.tr,
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
                            );
                          },
                        ),
                        const SizedBox(
                          height: 90,
                        ),
                      ]),
                ),
              ],
            ),
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
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.black,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          PageTransition(
                            child: SignUPpage2(),
                            type: PageTransitionType.fade,
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
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
