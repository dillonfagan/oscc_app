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
    apiKey: 'AIzaSyBTsI28e4jaboaQP-c2vurQ9FU7c585ab4',
    appId: '1:854674557315:web:cda3ce47cc25e2f9270eb6',
    messagingSenderId: '854674557315',
    projectId: 'oscc-app',
    authDomain: 'oscc-app.firebaseapp.com',
    storageBucket: 'oscc-app.appspot.com',
    databaseURL: 'https://oscc-app-default-rtdb.firebaseio.com/',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqxSltNOdHHAWsVk-l_4l_2LyUdqKJMSg',
    appId: '1:854674557315:android:dc54ecbcef7e7456270eb6',
    messagingSenderId: '854674557315',
    projectId: 'oscc-app',
    storageBucket: 'oscc-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC0oHcxmj_ExPVPTA4T3_S_HuDDUXvBhk8',
    appId: '1:854674557315:ios:4b3578f6b8c9d604270eb6',
    messagingSenderId: '854674557315',
    projectId: 'oscc-app',
    storageBucket: 'oscc-app.appspot.com',
    iosClientId:
        '854674557315-2b9hj2rv70dltij05k7ngc24he0bbl0r.apps.googleusercontent.com',
    iosBundleId: 'coop.starboard.oscc',
  );
}