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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDYBW8EEPXSbmGo9EXohckTgIYjtZlroQk',
    appId: '1:1076722276166:web:cdb825e0a73a0744fe7747',
    messagingSenderId: '1076722276166',
    projectId: 'smartlab-d8086',
    authDomain: 'smartlab-d8086.firebaseapp.com',
    databaseURL: 'https://smartlab-d8086-default-rtdb.firebaseio.com',
    storageBucket: 'smartlab-d8086.appspot.com',
    measurementId: 'G-3EXLQP8DJW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEibrbmoGatLU8MnSWovNdRw2ovyWru-8',
    appId: '1:1076722276166:android:eb6541d71c189c9cfe7747',
    messagingSenderId: '1076722276166',
    projectId: 'smartlab-d8086',
    databaseURL: 'https://smartlab-d8086-default-rtdb.firebaseio.com',
    storageBucket: 'smartlab-d8086.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLBaaQotPGYH-vnrSvbU-tSyCa_vwdVJo',
    appId: '1:1076722276166:ios:2ebb0dc19f9e6107fe7747',
    messagingSenderId: '1076722276166',
    projectId: 'smartlab-d8086',
    databaseURL: 'https://smartlab-d8086-default-rtdb.firebaseio.com',
    storageBucket: 'smartlab-d8086.appspot.com',
    iosClientId: '1076722276166-5tpn3qbt2stefrp982jdb7b2ttgclnel.apps.googleusercontent.com',
    iosBundleId: 'com.example.hardwareHub',
  );
}
