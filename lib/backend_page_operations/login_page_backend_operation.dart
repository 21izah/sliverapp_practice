// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:sliverapp_practice/pages/loginpage.dart';
import 'package:sliverapp_practice/pages/onboarding_page.dart';
import 'package:sliverapp_practice/pages/pin_code_page.dart';
import 'package:sliverapp_practice/pages/sign_in_homepage.dart';
import 'package:sliverapp_practice/pages/welcomesixth_page.dart';
import 'package:sliverapp_practice/widgets/hidden_drawer.dart';

import '../pages/comfirm_pin_page.dart';
import '../pages/onboarding_screen.dart';
import '../pages/verification_page.dart';

class LoginPageBackendOperation extends StatelessWidget {
  const LoginPageBackendOperation({Key? key}) : super(key: key);
  bool isUserSignedIn() {
    final user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  @override
  Widget build(BuildContext context) {
    if (isUserSignedIn()) {
      return VerificationPage();
    } else {
      return OnboardingScreen();
    }
    // return

    // Scaffold(
    //   // body: StreamBuilder<User?>(
    //   body: StreamBuilder<User?>(
    //     stream: FirebaseAuth.instance.authStateChanges(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         return SixthPage();
    //       } else {
    //         return OnboardingScreen();
    //       }
    //     },
    //   ),
    // );
  }
}
