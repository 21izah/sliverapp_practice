// ignore_for_file: use_build_context_synchronously, file_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// ignore: unused_import
import 'package:sliverapp_practice/pages/welcomesixth_page.dart';
import 'package:sliverapp_practice/widgets/hidden_drawer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetoWelcomePage();
  }

  _navigatetoWelcomePage() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HiddenDrawer(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            height: 400,
            width: 400,
            child: Lottie.asset('lib/assets/77096-service.json'),
          ),
        ],
      ),
    );
  }
}
