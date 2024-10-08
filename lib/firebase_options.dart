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
    apiKey: 'AIzaSyADCIkxocQnzcZ1_v945kFP8Fb_5civUMc',
    appId: '1:751650565194:web:935cd8c90b0f38c8ba0ab3',
    messagingSenderId: '751650565194',
    projectId: 'placement-25ef7',
    authDomain: 'placement-25ef7.firebaseapp.com',
    storageBucket: 'placement-25ef7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2PlIIT8gDkMa896JWnM46e6JgomSaoBA',
    appId: '1:751650565194:android:da0c2beb40072bf3ba0ab3',
    messagingSenderId: '751650565194',
    projectId: 'placement-25ef7',
    storageBucket: 'placement-25ef7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzsDEQJZ-Rs8rRj5KY8xVsHFfFwSQ8GpE',
    appId: '1:751650565194:ios:3103755128bb40fbba0ab3',
    messagingSenderId: '751650565194',
    projectId: 'placement-25ef7',
    storageBucket: 'placement-25ef7.appspot.com',
    iosBundleId: 'com.example.placement',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBzsDEQJZ-Rs8rRj5KY8xVsHFfFwSQ8GpE',
    appId: '1:751650565194:ios:3103755128bb40fbba0ab3',
    messagingSenderId: '751650565194',
    projectId: 'placement-25ef7',
    storageBucket: 'placement-25ef7.appspot.com',
    iosBundleId: 'com.example.placement',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyADCIkxocQnzcZ1_v945kFP8Fb_5civUMc',
    appId: '1:751650565194:web:20379b497617055aba0ab3',
    messagingSenderId: '751650565194',
    projectId: 'placement-25ef7',
    authDomain: 'placement-25ef7.firebaseapp.com',
    storageBucket: 'placement-25ef7.appspot.com',
  );
}
