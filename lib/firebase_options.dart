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
    apiKey: 'AIzaSyANukx5mb7gxxwSpGx5FuenU0eCxwdr91E',
    appId: '1:73740585100:web:335c36ad519e50081f93a9',
    messagingSenderId: '73740585100',
    projectId: 'asroo-shop-getx-921ba',
    authDomain: 'asroo-shop-getx-921ba.firebaseapp.com',
    storageBucket: 'asroo-shop-getx-921ba.appspot.com',
    measurementId: 'G-13XVEN4C55',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHtYq1EGgD0nRWcvh_aFye9kdZ3dOUWRU',
    appId: '1:73740585100:android:6a03e2765d25a40d1f93a9',
    messagingSenderId: '73740585100',
    projectId: 'asroo-shop-getx-921ba',
    storageBucket: 'asroo-shop-getx-921ba.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBkm_4mQ-RR4kAFgAA3SSKbgF5hwZly9Iw',
    appId: '1:73740585100:ios:d08629ae0a6359491f93a9',
    messagingSenderId: '73740585100',
    projectId: 'asroo-shop-getx-921ba',
    storageBucket: 'asroo-shop-getx-921ba.appspot.com',
    iosClientId: '73740585100-d4295gntiln7h8sc4u3j2g16uprpm1ot.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommercyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBkm_4mQ-RR4kAFgAA3SSKbgF5hwZly9Iw',
    appId: '1:73740585100:ios:d08629ae0a6359491f93a9',
    messagingSenderId: '73740585100',
    projectId: 'asroo-shop-getx-921ba',
    storageBucket: 'asroo-shop-getx-921ba.appspot.com',
    iosClientId: '73740585100-d4295gntiln7h8sc4u3j2g16uprpm1ot.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommercyApp',
  );
}
