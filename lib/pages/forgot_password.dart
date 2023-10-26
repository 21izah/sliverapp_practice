// ignore_for_file: unused_import, avoid_print, depend_on_referenced_packages

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sliverapp_practice/pages/help_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  Future passwordRest() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      // ),
      body: SingleChildScrollView(
        child: Column(

            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  bottom: 20,
                ),
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  bottom: 10,
                ),
                child: const Text(
                  "Can't remember your password? That's alright. Kindly provide the email you used un signing up",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.deepOrange),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  cursorColor: Colors.deepOrange,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.deepOrange,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.tertiary,
                              width: 2),
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  passwordRest();
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepOrange),
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Center(
                      child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              )
            ]),
      ),
    );
  }
}
