// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:sliverapp_practice/backend_page_operations/login_page_backend_operation.dart';
import 'package:sliverapp_practice/pages/loginpage.dart';
import 'package:sliverapp_practice/pages/onboarding_page.dart';
import 'package:sliverapp_practice/pages/sign_in_homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sliverapp_practice/pages/sign_up_page.dart';
import 'package:sliverapp_practice/pages/tab_bar.dart';
import 'package:sliverapp_practice/pages/welcome_page.dart';
import 'firebase_options.dart';
import 'package:url_launcher/url_launcher.dart';
import "package:hive_flutter/hive_flutter.dart";
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_launcher_icons/abs/icon_generator.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/flutter_launcher_icons_config.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPageBackendOperation(),
    );
  }
}
// flutter build apk --split-per-abi
// flutter pub run flutter_native_splash:create
//  flutter pub run flutter_launcher_icons
// minSdkVersion localProperties.getProperty('flutter.minSdkVersion').toInteger()
