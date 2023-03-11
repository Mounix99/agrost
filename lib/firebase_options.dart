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
    apiKey: 'AIzaSyBNZ0NJT9uldYgLRX2KH68pQ8HKlG8nl9k',
    appId: '1:15198462790:web:1eccf89247a334c093bb47',
    messagingSenderId: '15198462790',
    projectId: 'argost',
    authDomain: 'argost.firebaseapp.com',
    storageBucket: 'argost.appspot.com',
    measurementId: 'G-E5Z2B3NKGX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCY4w6IzkWiubsFeGS2chftKR_Vuq52Auc',
    appId: '1:15198462790:android:68cb5a6397640f5a93bb47',
    messagingSenderId: '15198462790',
    projectId: 'argost',
    storageBucket: 'argost.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQAjw5vV-fMjdnwdrL-dogwIVYEc9Oiqg',
    appId: '1:15198462790:ios:0c55747d3cc26bee93bb47',
    messagingSenderId: '15198462790',
    projectId: 'argost',
    storageBucket: 'argost.appspot.com',
    androidClientId: '15198462790-o38p19h4np6d4u5u31oj9cq36bojql5j.apps.googleusercontent.com',
    iosClientId: '15198462790-33gvb8t098200gg3reifksmpcssbjrcr.apps.googleusercontent.com',
    iosBundleId: 'com.agrost.agrost',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDQAjw5vV-fMjdnwdrL-dogwIVYEc9Oiqg',
    appId: '1:15198462790:ios:0c55747d3cc26bee93bb47',
    messagingSenderId: '15198462790',
    projectId: 'argost',
    storageBucket: 'argost.appspot.com',
    androidClientId: '15198462790-o38p19h4np6d4u5u31oj9cq36bojql5j.apps.googleusercontent.com',
    iosClientId: '15198462790-33gvb8t098200gg3reifksmpcssbjrcr.apps.googleusercontent.com',
    iosBundleId: 'com.agrost.agrost',
  );
}
