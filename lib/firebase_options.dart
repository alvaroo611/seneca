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
    apiKey: 'AIzaSyBOYIsXnUVAEkrbKc5CQCjrp7z3zBcHvm8',
    appId: '1:364563782587:web:97c77b35798e162e70829e',
    messagingSenderId: '364563782587',
    projectId: 'isenecafirebase-4a37f',
    authDomain: 'isenecafirebase-4a37f.firebaseapp.com',
    storageBucket: 'isenecafirebase-4a37f.appspot.com',
    measurementId: 'G-W4RFKY5PHM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLELanYfNLZ8Po_UUya6KWafH5HILh_ZI',
    appId: '1:364563782587:android:a8bed146affca6a770829e',
    messagingSenderId: '364563782587',
    projectId: 'isenecafirebase-4a37f',
    storageBucket: 'isenecafirebase-4a37f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0xEYXvQOtsEYB3XRrru7L67diWXbOroc',
    appId: '1:364563782587:ios:b718677afda030b870829e',
    messagingSenderId: '364563782587',
    projectId: 'isenecafirebase-4a37f',
    storageBucket: 'isenecafirebase-4a37f.appspot.com',
    androidClientId: '364563782587-e6mme1bfb6iplms3pracrqk9de0banuv.apps.googleusercontent.com',
    iosClientId: '364563782587-avht9ch74ittan9f9n6ht4tjsqll5071.apps.googleusercontent.com',
    iosBundleId: 'com.example.seneca',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB0xEYXvQOtsEYB3XRrru7L67diWXbOroc',
    appId: '1:364563782587:ios:1022bea1e770dcd670829e',
    messagingSenderId: '364563782587',
    projectId: 'isenecafirebase-4a37f',
    storageBucket: 'isenecafirebase-4a37f.appspot.com',
    androidClientId: '364563782587-e6mme1bfb6iplms3pracrqk9de0banuv.apps.googleusercontent.com',
    iosClientId: '364563782587-othueronfpugpbmu01dqp429aqbt1571.apps.googleusercontent.com',
    iosBundleId: 'com.example.seneca.RunnerTests',
  );
}
