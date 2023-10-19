import 'dart:io';

import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sliverapp_practice/LocalString.dart';
import 'package:sliverapp_practice/backend_page_operations/login_page_backend_operation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sliverapp_practice/riverpod_practice/accuont_balance.dart';
import 'package:sliverapp_practice/riverpod_practice/changeNotifier_provider.dart';
import 'package:sliverapp_practice/riverpod_practice/chat_service.dart';
import 'package:sliverapp_practice/riverpod_practice/withdrawal-verification.dart';
// import 'api_operations/google_sheets_api.dart';
import 'firebase_options.dart';
import "package:hive_flutter/hive_flutter.dart";
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import 'pages/notification_screen.dart';
import 'riverpod_practice/balance_obscure_provider.dart';
import 'riverpod_practice/changeButton_text.dart';
import 'riverpod_practice/change_light_dark_mode_provider.dart';
import 'riverpod_practice/change_onboarding_screen.dart';
import 'riverpod_practice/comfirm_pin_provider.dart';
import 'riverpod_practice/create_pin_provider.dart';
import 'riverpod_practice/dropdown_provider.dart';
import 'riverpod_practice/logout_button_text.dart';
import 'riverpod_practice/save_screen_state.dart';
import 'riverpod_practice/sign_up_provider.dart';
import 'riverpod_practice/theme_provider.dart';
import 'riverpod_practice/transaction_service.dart';
import 'riverpod_practice/verification_button.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
// import 'package:flutter/foundation.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  OneSignal.initialize("71ee0854-dd08-4f96-b923-91f3d52f1ee5");

//   // Pass in email provided by customer
// OneSignal.User.addEmail("example@domain.com")

// // Pass in phone number provided by customer
// OneSignal.User.addSms("+11234567890")

  // GoogleSheetsApi().init();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseMessaging.instance.getInitialMessage();
  // FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);
  await ChatService().requestPermission();

  await Hive.initFlutter();
  await Supabase.initialize(
    url: 'https://cnzpblcmmknuoynupsog.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNuenBibGNtbWtudW95bnVwc29nIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Nzc3NzE3NjYsImV4cCI6MTk5MzM0Nzc2Nn0.GdstENXbZ0qpjChzYf8GlJ1KcJ-NF-K1sgIAck-JRKY',
  );

  await Hive.openBox('username');
  await Hive.openBox('mybox');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Counter(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangeButtonTextProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VerificationButton(),
        ),
        ChangeNotifierProvider(
          create: (context) => LogOutButton(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangeLightDarkMode(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUPpage2Provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CreatePinProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ComfirmPinProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BalanceObscureProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppState(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AccountBalance(),
        ),
        ChangeNotifierProvider(
          create: (context) => WithrawalVerification(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionService(),
        ),
        ChangeNotifierProvider(
          create: (context) => DropdownStateProvider()..loadSelectedvalue(),
        ),
        ChangeNotifierProvider(
          create: (context) => ColorChangeModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

final supabase = Supabase.instance.client;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangeLightDarkMode>(
      builder: (context, you, _) => RootRestorationScope(
        restorationId: 'root',
        child: GetMaterialApp(
          translations: LocalString(),
          locale: Locale('en'),
          themeMode: you.themeMode,
          theme: Mytheme.lightTheme,
          darkTheme: Mytheme.darkTheme,
          debugShowCheckedModeBanner: false,
          home: LoginPageBackendOperation(),
          navigatorKey: navigatorKey,
          routes: {
            '/notification_screen': (context) => NotificationScreen(),
          },
        ),
      ),
    );
  }
}




// android:usesCleartextTraffic="true">
// flutter build apk --split-per-abi
// flutter pub run flutter_native_splash:create
//  flutter pub run flutter_launcher_icons
// minSdkVersion localProperties.getProperty('flutter.minSdkVersion').toInteger()
// https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=USD
// flutter pub run build_runner build
// flutter build macos
// flutter build windows

