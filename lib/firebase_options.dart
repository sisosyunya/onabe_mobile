// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyCN62ANfA_zA8_4b0f6t491I9XH2qBV0Og',
    appId: '1:982404418246:web:1a00098e9d548bfef6e5c7',
    messagingSenderId: '982404418246',
    projectId: 'onabe-9d673',
    authDomain: 'onabe-9d673.firebaseapp.com',
    storageBucket: 'onabe-9d673.appspot.com',
    measurementId: 'G-K8Z6P0HNMX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAlSnip-qbqZN28CEi4UcZsPWFb3I-yRI',
    appId: '1:982404418246:android:2435dd6c13ca4f3df6e5c7',
    messagingSenderId: '982404418246',
    projectId: 'onabe-9d673',
    storageBucket: 'onabe-9d673.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDdsIQk3tmYXm0SoMXlkCsPrfqYaJ4vimc',
    appId: '1:982404418246:ios:1087739c9656ac51f6e5c7',
    messagingSenderId: '982404418246',
    projectId: 'onabe-9d673',
    storageBucket: 'onabe-9d673.appspot.com',
    iosBundleId: 'com.example.onabeMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDdsIQk3tmYXm0SoMXlkCsPrfqYaJ4vimc',
    appId: '1:982404418246:ios:ce7cf9808d824f3af6e5c7',
    messagingSenderId: '982404418246',
    projectId: 'onabe-9d673',
    storageBucket: 'onabe-9d673.appspot.com',
    iosBundleId: 'com.example.onabeMobile.RunnerTests',
  );
}
