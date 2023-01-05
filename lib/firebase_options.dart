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
    apiKey: 'AIzaSyCSDFRdU6xOd3s7ah6iLLhMnNZ_tIqqqwI',
    appId: '1:675628233275:web:6bdb583ef887bbff4aa21e',
    messagingSenderId: '675628233275',
    projectId: 'handy-men-d312e',
    authDomain: 'handy-men-d312e.firebaseapp.com',
    databaseURL: 'https://handy-men-d312e-default-rtdb.firebaseio.com',
    storageBucket: 'handy-men-d312e.appspot.com',
    measurementId: 'G-NT5S70V1T3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDIbE_KW1FP0KizcVPxPG96J29h4aEDgkY',
    appId: '1:675628233275:android:1a9097d4762330054aa21e',
    messagingSenderId: '675628233275',
    projectId: 'handy-men-d312e',
    databaseURL: 'https://handy-men-d312e-default-rtdb.firebaseio.com',
    storageBucket: 'handy-men-d312e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNitDHvWdz4GFiS1g4e3JgpETsGR4P2Zk',
    appId: '1:675628233275:ios:a5dd0fa454c3bc5e4aa21e',
    messagingSenderId: '675628233275',
    projectId: 'handy-men-d312e',
    databaseURL: 'https://handy-men-d312e-default-rtdb.firebaseio.com',
    storageBucket: 'handy-men-d312e.appspot.com',
    iosClientId: '675628233275-4j0o4ruo5kucnthj1dui8ofskd80bi5b.apps.googleusercontent.com',
    iosBundleId: 'com.example.restOrRant',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCNitDHvWdz4GFiS1g4e3JgpETsGR4P2Zk',
    appId: '1:675628233275:ios:a5dd0fa454c3bc5e4aa21e',
    messagingSenderId: '675628233275',
    projectId: 'handy-men-d312e',
    databaseURL: 'https://handy-men-d312e-default-rtdb.firebaseio.com',
    storageBucket: 'handy-men-d312e.appspot.com',
    iosClientId: '675628233275-4j0o4ruo5kucnthj1dui8ofskd80bi5b.apps.googleusercontent.com',
    iosBundleId: 'com.example.restOrRant',
  );
}