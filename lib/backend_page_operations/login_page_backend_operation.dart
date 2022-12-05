// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:sliverapp_practice/pages/loginpage.dart';
import 'package:sliverapp_practice/pages/onboarding_page.dart';
import 'package:sliverapp_practice/pages/sign_in_homepage.dart';
import 'package:sliverapp_practice/pages/welcomesixth_page.dart';

class LoginPageBackendOperation extends StatelessWidget {
  const LoginPageBackendOperation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const SixthPage();
          } else {
            return OnboardingPage();
          }
        },
      ),
    );
  }
}
