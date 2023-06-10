import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/admin_hidden_drawer.dart';

class AdminLoginScreen extends StatefulWidget {
  AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final passwordController = TextEditingController();

  final comfirmedPasswordController = TextEditingController();

  void dispose() {
    passwordController.dispose();
    comfirmedPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            cursorColor: Colors.deepOrange,
            //   keyboardType: TextInputType.emailAddress,
            controller: passwordController,
            decoration: InputDecoration(
                hintText: 'Passowrd',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            cursorColor: Colors.deepOrange,
            //   keyboardType: TextInputType.emailAddress,
            controller: comfirmedPasswordController,
            decoration: InputDecoration(
                hintText: 'Comfirm Password',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (passwordController.text.trim() == 'green' &&
                comfirmedPasswordController.text.trim() == 'green') {
              Get.to(AdminHiddenDrawer());
            } else {
              Get.defaultDialog(
                  title: 'Wrong Password',
                  content: Text('please input correctt password'),
                  backgroundColor: Colors.white);
            }
            // Get.to(
            //   const SplashScreen(),
            //   transition: Transition.upToDown,
            //   duration: const Duration(seconds: 2),
            // );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: 100,
              color: Colors.blue.shade900,
              child: const Center(child: Text('Sign In')),
            ),
          ),
        ),
      ]),
    );
  }
}
