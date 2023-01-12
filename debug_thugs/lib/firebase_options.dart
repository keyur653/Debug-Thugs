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
    apiKey: 'AIzaSyAWGKatb1lC5K1TdzvXTwbEGGznJO1Gois',
    appId: '1:311215492085:web:7c23f632015ddc2a7beebc',
    messagingSenderId: '311215492085',
    projectId: 'stippendmanagement',
    authDomain: 'stippendmanagement.firebaseapp.com',
    storageBucket: 'stippendmanagement.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOXSibgTWNkjzIPt29SeE8aDw6pVsnFdY',
    appId: '1:311215492085:android:a91e4872558997547beebc',
    messagingSenderId: '311215492085',
    projectId: 'stippendmanagement',
    storageBucket: 'stippendmanagement.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1T-mAapijW5mEY8k0lfFRw_D-F_7VycA',
    appId: '1:311215492085:ios:707be02f927243067beebc',
    messagingSenderId: '311215492085',
    projectId: 'stippendmanagement',
    storageBucket: 'stippendmanagement.appspot.com',
    iosClientId: '311215492085-mqrmp9hoehtndkgknmhaomhdtd4g8j1i.apps.googleusercontent.com',
    iosBundleId: 'com.example.debugThugs',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1T-mAapijW5mEY8k0lfFRw_D-F_7VycA',
    appId: '1:311215492085:ios:707be02f927243067beebc',
    messagingSenderId: '311215492085',
    projectId: 'stippendmanagement',
    storageBucket: 'stippendmanagement.appspot.com',
    iosClientId: '311215492085-mqrmp9hoehtndkgknmhaomhdtd4g8j1i.apps.googleusercontent.com',
    iosBundleId: 'com.example.debugThugs',
  );
}
