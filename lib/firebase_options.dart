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
    apiKey: 'AIzaSyBiYPrg1vWtSlGYbqgSj4VTDsqTdxTcIgc',
    appId: '1:597698425602:web:0781e0571b79151b65081b',
    messagingSenderId: '597698425602',
    projectId: 'perkasa1-6c7bc',
    authDomain: 'perkasa1-6c7bc.firebaseapp.com',
    storageBucket: 'perkasa1-6c7bc.appspot.com',
    measurementId: 'G-MXE3BXRXM0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTZwbI5bH2vPfnZUfxusD1IrHy1SA4EIE',
    appId: '1:597698425602:android:68bd222a5d33c60265081b',
    messagingSenderId: '597698425602',
    projectId: 'perkasa1-6c7bc',
    storageBucket: 'perkasa1-6c7bc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCz6SItQTLwihnBDDHrrQBeTzrr0FF0RF8',
    appId: '1:597698425602:ios:26e7cb637ecbbfb265081b',
    messagingSenderId: '597698425602',
    projectId: 'perkasa1-6c7bc',
    storageBucket: 'perkasa1-6c7bc.appspot.com',
    iosBundleId: 'com.example.perkasa1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCz6SItQTLwihnBDDHrrQBeTzrr0FF0RF8',
    appId: '1:597698425602:ios:26e7cb637ecbbfb265081b',
    messagingSenderId: '597698425602',
    projectId: 'perkasa1-6c7bc',
    storageBucket: 'perkasa1-6c7bc.appspot.com',
    iosBundleId: 'com.example.perkasa1',
  );
}
