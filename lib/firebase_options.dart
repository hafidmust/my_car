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
    apiKey: 'AIzaSyA0rdQ93dypBP-WTfQBe1zidodAZh9fniE',
    appId: '1:548546914666:web:eca9701f857c31813c5d13',
    messagingSenderId: '548546914666',
    projectId: 'my-car-dcb68',
    authDomain: 'my-car-dcb68.firebaseapp.com',
    storageBucket: 'my-car-dcb68.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvzM8gMW14BOp9k-pHDW2cz3h9tTLy3u4',
    appId: '1:548546914666:android:05f3335fa4c36ee43c5d13',
    messagingSenderId: '548546914666',
    projectId: 'my-car-dcb68',
    storageBucket: 'my-car-dcb68.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-SDnk7wBtl0hpP1dICzSDJLCKrbeB5GI',
    appId: '1:548546914666:ios:a10b109893fd71063c5d13',
    messagingSenderId: '548546914666',
    projectId: 'my-car-dcb68',
    storageBucket: 'my-car-dcb68.appspot.com',
    iosClientId: '548546914666-8hnjucougugisdk0k0cer2us3ri78sqr.apps.googleusercontent.com',
    iosBundleId: 'com.example.myCar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-SDnk7wBtl0hpP1dICzSDJLCKrbeB5GI',
    appId: '1:548546914666:ios:50969e4edf6c5d913c5d13',
    messagingSenderId: '548546914666',
    projectId: 'my-car-dcb68',
    storageBucket: 'my-car-dcb68.appspot.com',
    iosClientId: '548546914666-7us1uuteag7baom4bn0fkpl6md85mc4h.apps.googleusercontent.com',
    iosBundleId: 'com.example.myCar.RunnerTests',
  );
}
