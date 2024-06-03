// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAwQbXocJcuz-kW57anCZCem_aJUYDmp-Q',
    appId: '1:695372437143:web:1b8e53627546d9f4ebfbd2',
    messagingSenderId: '695372437143',
    projectId: 'learn-auth-lesson-1',
    authDomain: 'learn-auth-lesson-1.firebaseapp.com',
    storageBucket: 'learn-auth-lesson-1.appspot.com',
    measurementId: 'G-RDSXS1F749',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtQm-KbWUHXCCg895yOJWci3S8SnsHHVg',
    appId: '1:695372437143:android:4e6c941084c0e713ebfbd2',
    messagingSenderId: '695372437143',
    projectId: 'learn-auth-lesson-1',
    storageBucket: 'learn-auth-lesson-1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-pVuXlGndwkqKjjbRiM9pZ9SBS4jw7tI',
    appId: '1:695372437143:ios:b16f46dc8f9a76f3ebfbd2',
    messagingSenderId: '695372437143',
    projectId: 'learn-auth-lesson-1',
    storageBucket: 'learn-auth-lesson-1.appspot.com',
    iosBundleId: 'com.example.firebaseAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-pVuXlGndwkqKjjbRiM9pZ9SBS4jw7tI',
    appId: '1:695372437143:ios:b16f46dc8f9a76f3ebfbd2',
    messagingSenderId: '695372437143',
    projectId: 'learn-auth-lesson-1',
    storageBucket: 'learn-auth-lesson-1.appspot.com',
    iosBundleId: 'com.example.firebaseAuth',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAwQbXocJcuz-kW57anCZCem_aJUYDmp-Q',
    appId: '1:695372437143:web:54d9f1f34b0ad447ebfbd2',
    messagingSenderId: '695372437143',
    projectId: 'learn-auth-lesson-1',
    authDomain: 'learn-auth-lesson-1.firebaseapp.com',
    storageBucket: 'learn-auth-lesson-1.appspot.com',
    measurementId: 'G-SLH3WBXVWE',
  );
}
