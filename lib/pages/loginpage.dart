// ignore_for_file: sized_box_for_whitespace, unused_import, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sliverapp_practice/pages/forgot_password.dart';
import 'package:sliverapp_practice/pages/welcomesixth_page.dart';
import 'package:sliverapp_practice/pages/welcome_page.dart';

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
          return const Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
            backgroundColor: Colors.black,
            strokeWidth: 5,
            color: Colors.black,
          ));
        });
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim())
        .then((value) => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const SixthPage(),
            ),
            (route) => false));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
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
                  height: 40,
                ),
                TextFormField(
                  cursorColor: Colors.deepOrange,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  cursorColor: Colors.deepOrange,
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
                          color: Colors.deepOrange,
                        ),
                      ),
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 5,
                ),
                IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ForgotPasswordPage(),
                            ));
                          },
                          child: const Center(
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.deepOrange,
                            offset: Offset(10, 5),
                            blurRadius: 15,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(-3, -3),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ],
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  //    child: ElevatedButton(
                  // style: ElevatedButton.styleFrom(

                  //     backgroundColor: const Color(0xFF92390F),
                  //     foregroundColor: const Color(0xFFFFFFFF)),
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
                const SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
