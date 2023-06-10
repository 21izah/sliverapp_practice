import 'dart:io';

import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sliverapp_practice/backend_page_operations/login_page_backend_operation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sliverapp_practice/riverpod_practice/changeNotifier_provider.dart';
import 'api_operations/google_sheets_api.dart';
import 'firebase_options.dart';
import "package:hive_flutter/hive_flutter.dart";
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import 'riverpod_practice/changeButton_text.dart';
import 'riverpod_practice/change_light_dark_mode_provider.dart';
import 'riverpod_practice/comfirm_pin_provider.dart';
import 'riverpod_practice/create_pin_provider.dart';
import 'riverpod_practice/logout_button_text.dart';
import 'riverpod_practice/sign_up_provider.dart';
import 'riverpod_practice/verification_button.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';

// const _credentials = r'''
// {
//   "type": "service_account",
//   "project_id": "cza-exchange",
//   "private_key_id": "aa1394bd32b5839d7584a6eed1c6127af2868195",
//   "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCcpoyoQK0JlQKT\n5z1sU7Y1x6JvjVOqUrngVbGoyCWdTuRg0DR7pyZA+EzpQbStF7SQo4ooFJ1TZSLN\nS8mvjlVuYqq1ums3/+FfApns/CJ6iOsK1DEuEyFtYbkmysbA06G6rtkfP8i92k91\nvXE1gsQ/UPowhI5iul5cryCRDblSKn7RUfWwoEZDvnOO69O7BcxbTCWh6khLvWKI\nVVykG2EScnhtpYUEYYiLWokVFrS1K9NFfzxnAorfQi8uurtODp1YRA2GFE2YG1+0\nyV8X6MzjhQ3vz1+QE7jhmVzyLGYx1HyLMJvIzOktLRahvbdqek5AhdPrWatvTTpu\nNFLpc05fAgMBAAECggEAQpaBX9vuMg6HQ/udnniPEZlEsQpwMAxuOq/yjv5VDuNE\nLOsUBCPvHNrvRo/Jj3JuLLV3usXYgmSRQJcgqmFka0HBsvIFNY6tbEecyqH6vf+J\nedbs+Nrk8KwDmjvD9J+BNeuxG5lvaVRtRm06vDZT2V5Am3MdW1ZBWkCPJVmiFwyS\nj7/fAUpBM8Vu1exzVkx7zABNKSuf64f+fKpmp7cUUQSgrcRYZFKBodJ7KymuO1v5\np4DU2mbPo30sH2Tyoxo0zM+WbTC87ErDmyL7qAJPinA6aCDwGeqf1krYdJz0Q4yu\nqUrizMO7hDBG6EAcrQ5i8n2Wn4QgZWRYYEqBn+sksQKBgQDYNisS+BZZ6OCTDAfC\nlc+00e9nOilpReOpKUN8YXEa2XwxG3LiBfgBcPvLnYxPHy6+XgF63yEwW39iD8kT\nY8xDu2A3D5XazFsxJ0eeTCuJh7buRETrmcDJWu91BOA9h6X2m1ePnx2y7eDr7PvY\nfdyveejxQi+iYiEJbzniRoVMqwKBgQC5em71+Ka38CJsv5WrVm6DrHcR8T0oZjZD\nBf9WgmMlyGadBLPuUqcnFqgQGhN0OW4x0bB6gNggghAIdhGPulsgMBCY8QP4YgBT\nQaIccUKbOKqzI6cyDCt6dlZBsc9zJmC2zoM8SDT4muZkhXV/dBO0awtLtF5S/olD\nrnhyV37dHQKBgQCVaXGAzVJc1ZKD65ddP7vmoAEJ2+aMKlD2MF7DkG7h+BNbuDU+\nvpMxI8vNXNV+Q/VAdqQdLh64VTKFKJVywc+BqvYFds6/AeOu5w8V9FtN0ix3IVRj\nX8AbJa0+t5ziyF/HOHhc9r9GTB7XytALPocH+H4iYvOaCqf75hIhLUymuwKBgQCU\nKbl5w6dqR+k39dMZi3G8vYhgTNUN8Jhn8eKGuKF7DRrrU1Zoip38G50lP69KqJXe\nNiNDuKjtTvh/ydE9fyBMFhksE1uYjrCz0Toufks2s42ojFKDKDWTHfTJhcCxu3aG\nkXFENmoaLaLdqb6ykYcsGFZtoye2JJ6B8l1E+Z/eAQKBgHdhucOdZeREGPpggNdI\ntvjTdQiWw5NYcjgZWKGsEohRv+NPP7K/8R0TR9mX3q22yEjoBujcN/+ZPTBQWqs6\nrAblUqxzo61dDafEiu1yBiySks2EyL6zOCs+jKwfj79xj9UN2YTitnzP6d77bIHN\n7pKjTksVQfuZgOnCBgAOd5PC\n-----END PRIVATE KEY-----\n",
//   "client_email": "cza-exchange@cza-exchange.iam.gserviceaccount.com",
//   "client_id": "108027308712236064918",
//   "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//   "token_uri": "https://oauth2.googleapis.com/token",
//   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/cza-exchange%40cza-exchange.iam.gserviceaccount.com"
// }
// ''';

// const _spreadsheetId = '1xGWlClghbKtUycNaXmdw_juI5hpyb_IGGH99AI_4kfk';
void main() async {
  // final gsheets = GSheets(_credentials);
  // final ss = await gsheets.spreadsheet(_spreadsheetId);
  // var sheet = ss.worksheetByTitle('WorkSheet1');
  // await sheet!.values.insertValue('Michael', column: 1, row: 1);
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSheetsApi().init();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Supabase.initialize(
    url: 'https://cnzpblcmmknuoynupsog.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNuenBibGNtbWtudW95bnVwc29nIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Nzc3NzE3NjYsImV4cCI6MTk5MzM0Nzc2Nn0.GdstENXbZ0qpjChzYf8GlJ1KcJ-NF-K1sgIAck-JRKY',
  );

  await Hive.openBox('username');

  runApp(MultiProvider(
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
    ],
    child: MyApp(),
  ));
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
      builder: (context, you, _) => GetMaterialApp(
        themeMode: you.themeMode,
        theme: Mytheme.lightTheme,
        darkTheme: Mytheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: LoginPageBackendOperation(),
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

// requirements for selling 
// amount of btc
// name on account 
// account number 
// bank name

// pay to this btc wallet 



// requirement for buying 

// amount of btc

// btc wallet address 
// btc wallet address
// network

