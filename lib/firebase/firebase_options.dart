// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDWMSLvrB2xW7lYTg3wQdg57Zq4uyWZfEU',
    appId: '1:931094397369:web:4b112547539175fd9e3668',
    messagingSenderId: '931094397369',
    projectId: 'campus-delight-e0c99',
    authDomain: 'campus-delight-e0c99.firebaseapp.com',
    storageBucket: 'campus-delight-e0c99.appspot.com',
    measurementId: 'G-GCK8ST2C0Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxWIALARbQbXv5yIyn_riESHvyZwmHqOs',
    appId: '1:931094397369:android:6226630d827062249e3668',
    messagingSenderId: '931094397369',
    projectId: 'campus-delight-e0c99',
    storageBucket: 'campus-delight-e0c99.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwX4i586eA_P2GoKCCGUXkAy5BWi4rM4o',
    appId: '1:931094397369:ios:67fda5b7b6403edb9e3668',
    messagingSenderId: '931094397369',
    projectId: 'campus-delight-e0c99',
    storageBucket: 'campus-delight-e0c99.appspot.com',
    iosClientId: '931094397369-ol3mtv7cfpgnmpetb2epptpgad9ds8hh.apps.googleusercontent.com',
    iosBundleId: 'com.wonderios.zone',
  );
}
