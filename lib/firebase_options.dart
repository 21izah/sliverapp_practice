// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members, depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAZ_gwj3tBdJf2QIIvCyLbkVFe3pVXuwGg',
    appId: '1:315602189139:web:05805641d386a991c9bfa6',
    messagingSenderId: '315602189139',
    projectId: 'firstappfirebase-54457',
    authDomain: 'firstappfirebase-54457.firebaseapp.com',
    storageBucket: 'firstappfirebase-54457.appspot.com',
    measurementId: 'G-NX3ZB2ENSJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_KuAv1Pp7VptGXxbeMACB6S7_11Rf1PA',
    appId: '1:315602189139:android:dac9f791c327533bc9bfa6',
    messagingSenderId: '315602189139',
    projectId: 'firstappfirebase-54457',
    storageBucket: 'firstappfirebase-54457.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyColDF3Jy9kj6ckULaCp9ZNJ_bZpivoXt4',
    appId: '1:315602189139:ios:f5311cb10456f7cec9bfa6',
    messagingSenderId: '315602189139',
    projectId: 'firstappfirebase-54457',
    storageBucket: 'firstappfirebase-54457.appspot.com',
    iosClientId:
        '315602189139-7b347ggmpokcmsge2coieco93qmu0ipk.apps.googleusercontent.com',
    iosBundleId: 'com.example.sliverappPractice',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyColDF3Jy9kj6ckULaCp9ZNJ_bZpivoXt4',
    appId: '1:315602189139:ios:f5311cb10456f7cec9bfa6',
    messagingSenderId: '315602189139',
    projectId: 'firstappfirebase-54457',
    storageBucket: 'firstappfirebase-54457.appspot.com',
    iosClientId:
        '315602189139-7b347ggmpokcmsge2coieco93qmu0ipk.apps.googleusercontent.com',
    iosBundleId: 'com.example.sliverappPractice',
  );
}