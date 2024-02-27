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
    apiKey: 'AIzaSyAdlCWQn7GOGn1i4Y32BcTGJVlHEiMtMgI',
    appId: '1:571107992454:web:9d1415febbc3ff76d24207',
    messagingSenderId: '571107992454',
    projectId: 'zomato-clone-fc94b',
    authDomain: 'zomato-clone-fc94b.firebaseapp.com',
    storageBucket: 'zomato-clone-fc94b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDgSeyR52IhCVISSvphbMYQtogHLISSYPY',
    appId: '1:571107992454:android:d2efb05b0fb711aed24207',
    messagingSenderId: '571107992454',
    projectId: 'zomato-clone-fc94b',
    storageBucket: 'zomato-clone-fc94b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAP39vEq5lNmbDlxRbsK7FU8p1NNc_n_fI',
    appId: '1:571107992454:ios:9d0eb133ab36b538d24207',
    messagingSenderId: '571107992454',
    projectId: 'zomato-clone-fc94b',
    storageBucket: 'zomato-clone-fc94b.appspot.com',
    iosBundleId: 'com.example.zomatoClone',
  );
}
