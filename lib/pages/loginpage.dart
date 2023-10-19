// ignore_for_file: sized_box_for_whitespace, unused_import, sort_child_properties_last, depend_on_referenced_packages, unused_local_variable

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_snackbar/simple_snackbar.dart';
import 'package:sliverapp_practice/pages/forgot_password.dart';
import 'package:sliverapp_practice/pages/welcomesixth_page.dart';
import 'package:sliverapp_practice/pages/welcome_page.dart';
import 'package:sliverapp_practice/widgets/hidden_drawer.dart';

import 'sign_up_page.dart';
import '../constants/data_constant.dart';
import '../data/api_calls/jsonProvider.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
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
      // .then((value) =>
      await Future.delayed(Duration(seconds: 3));

      AnimatedSnackBar(
        mobileSnackBarPosition: MobileSnackBarPosition.top,
        builder: ((context) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(8),
            // color: Colors.green,
            height: 60,

            width: 350,
            child: Center(
                child: Text(
              ' Pleased To Have You Back Investor',
              style: TextStyle(
                color: whiteColor,
              ),
            )),
          );
        }),
      ).show(context);

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const SixthPage(),
          ),
          (route) => false);
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
          Column(
            //mainAxisAlignment: MainAxisAlignment.center,
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
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: screenSize.height * 0.1,
                          width: screenSize.width * 0.2,
                          child: Image.asset('lib/assets/Cza_new_prev_ui.png')),
                    ]),
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
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            speed: const Duration(milliseconds: 50),
                            'Welcome Back Investor',
                            textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: blackColor),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20,
                          top: 10,
                          bottom: 10,
                        ),
                        child: TextFormField(
                          style: TextStyle(color: primaryColor),
                          controller: _emailController,
                          cursorColor: primaryColor,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () => _emailController.clear(),
                                icon: Icon(
                                  Icons.clear,
                                  color: primaryColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                  color: blackColor,
                                  fontSize: screenSize.width * 0.03),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20,
                          bottom: 10,
                        ),
                        child: TextFormField(
                          style: TextStyle(color: primaryColor),
                          controller: _passwordController,
                          obscureText: passwordObscured,
                          cursorColor: primaryColor,
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
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: blackColor,
                                  fontSize: screenSize.width * 0.03),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
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
                                    'Forgot password?',
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
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 50,
                          width: screenSize.width,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: GestureDetector(
                            onTap: signIn,
                            child: const Center(
                              child: Text(
                                'SIGN IN',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 90,
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
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.black,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          PageTransition(
                            child: SignUPpage(),
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
                          'SIGN UP',
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
