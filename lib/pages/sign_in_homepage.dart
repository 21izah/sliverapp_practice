// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:sliverapp_practice/backend_page_operations/login_page_backend_operation.dart';
import 'package:sliverapp_practice/pages/help_page.dart';
import 'package:sliverapp_practice/pages/onboarding_page.dart';
import 'package:sliverapp_practice/pages/profile_page.dart';
import 'package:sliverapp_practice/pages/sign_up_page.dart';
import 'package:sliverapp_practice/pages/loginpage.dart';
import 'package:sliverapp_practice/pages/welcomesixth_page.dart';

class SignInHomePage extends StatefulWidget {
  // final VoidCallback showRegisterPage;

  const SignInHomePage({
    Key? key,

//  required this.showRegisterPage
  }) : super(key: key);

  @override
  State<SignInHomePage> createState() => _SignInHomePageState();
}

class _SignInHomePageState extends State<SignInHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 200),
                height: 300,
                width: 250,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.deepOrange,
                        blurRadius: 15,
                        offset: Offset(5, 5),
                        spreadRadius: 2,
                      ),
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 15,
                        offset: Offset(-10, -10),
                        spreadRadius: 2,
                      ),
                    ],
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                child: Image.asset('lib/assets/Cza.jpg'),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: Colors.deepOrange,
                  blurRadius: 15,
                  offset: Offset(5, 5),
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 15,
                  offset: Offset(-10, -10),
                  spreadRadius: 2,
                ),
              ], borderRadius: BorderRadius.circular(20), color: Colors.black),
              margin: const EdgeInsets.all(20),
              height: 50,
              width: 200,
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LogInPage(),
                    ));
                  },
                  child: const Center(
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )),

              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => const LogInPage(),
              //     ));
              //   },
              //   style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.black,
              //       foregroundColor: Colors.white),
              //   child:

              //    const Text('SIGN IN',
              //       style: TextStyle(
              //         fontSize: 20,
              //       )),
              // ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              color: Color(0xFF92390F),
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.deepOrange,
                        blurRadius: 15,
                        offset: Offset(5, 5),
                        spreadRadius: 2,
                      ),
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 15,
                        offset: Offset(-10, -10),
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: TextButton(
                    onPressed: () => {
                      //            widget.showRegisterPage,
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUPpage(),
                      ))
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.deepOrange),
                    ),
                  ),
                ),
                // const SizedBox(
                //   width: 0,
                // ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  margin: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.deepOrange,
                        blurRadius: 15,
                        offset: Offset(5, 5),
                        spreadRadius: 2,
                      ),
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 15,
                        offset: Offset(-10, -10),
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () => {
                      //            widget.showRegisterPage,
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HelpPage(),
                      ))
                    },
                    child: const Text(
                      'Help',
                      style: TextStyle(color: Colors.deepOrange),
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 100,
                // ),
              ],
            ),
            const SizedBox(
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
