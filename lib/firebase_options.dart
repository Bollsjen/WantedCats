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
    apiKey: 'AIzaSyD5f1p9AX78LgnmVPfSNz0auSYrsKY3qUY',
    appId: '1:950590820413:web:ea44cfeea356fafddd1a54',
    messagingSenderId: '950590820413',
    projectId: 'wantedcats2',
    authDomain: 'wantedcats2.firebaseapp.com',
    storageBucket: 'wantedcats2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCkpIp5nyaciSEuEtRA9MHkptnLy5dWcMY',
    appId: '1:950590820413:android:614b657e17ec0c44dd1a54',
    messagingSenderId: '950590820413',
    projectId: 'wantedcats2',
    storageBucket: 'wantedcats2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCN_8RPA1eQAq05XticCQyOImDSLYDCNEw',
    appId: '1:950590820413:ios:9a90fd80aa86dc06dd1a54',
    messagingSenderId: '950590820413',
    projectId: 'wantedcats2',
    storageBucket: 'wantedcats2.appspot.com',
    iosClientId: '950590820413-8on0goj1ejr2cvfukmctr28pjjlpgb7u.apps.googleusercontent.com',
    iosBundleId: 'com.example.wantedCats',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCN_8RPA1eQAq05XticCQyOImDSLYDCNEw',
    appId: '1:950590820413:ios:9a90fd80aa86dc06dd1a54',
    messagingSenderId: '950590820413',
    projectId: 'wantedcats2',
    storageBucket: 'wantedcats2.appspot.com',
    iosClientId: '950590820413-8on0goj1ejr2cvfukmctr28pjjlpgb7u.apps.googleusercontent.com',
    iosBundleId: 'com.example.wantedCats',
  );
}
