// // File generated by FlutterFire CLI.
// // ignore_for_file: type=lint
// import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
// import 'package:flutter/foundation.dart'
//     show defaultTargetPlatform, kIsWeb, TargetPlatform;
//
// /// Default [FirebaseOptions] for use with your Firebase apps.
// ///
// /// Example:
// /// ```dart
// /// import 'firebase_options.dart';
// /// // ...
// /// await Firebase.initializeApp(
// ///   options: DefaultFirebaseOptions.currentPlatform,
// /// );
// /// ```
// class DefaultFirebaseOptions {
//   static FirebaseOptions get currentPlatform {
//     if (kIsWeb) {
//       return web;
//     }
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.android:
//         return android;
//       case TargetPlatform.iOS:
//         return ios;
//       case TargetPlatform.macOS:
//         return macos;
//       case TargetPlatform.windows:
//         return windows;
//       case TargetPlatform.linux:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions have not been configured for linux - '
//           'you can reconfigure this by running the FlutterFire CLI again.',
//         );
//       default:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions are not supported for this platform.',
//         );
//     }
//   }
//
//   static const FirebaseOptions web = FirebaseOptions(
//     apiKey: 'AIzaSyAGoN1gZtCHp0Ytl-PQl4e5W_0Oo954434',
//     appId: '1:172909494619:web:d573495f27fe56435e5a7e',
//     messagingSenderId: '172909494619',
//     projectId: 'firstapp-62132',
//     authDomain: 'firstapp-62132.firebaseapp.com',
//     storageBucket: 'firstapp-62132.appspot.com',
//     measurementId: 'G-CBJJXYJ4DE',
//   );
//
//   static const FirebaseOptions android = FirebaseOptions(
//     apiKey: 'AIzaSyAXG5hCU0SkvsJE0R0Bb3ehMFUrsGWezYs',
//     appId: '1:172909494619:android:9445abf96ab563fd5e5a7e',
//     messagingSenderId: '172909494619',
//     projectId: 'firstapp-62132',
//     storageBucket: 'firstapp-62132.appspot.com',
//   );
//
//   static const FirebaseOptions ios = FirebaseOptions(
//     apiKey: 'AIzaSyBHu4AHG1gH7H6K6toWv0R2M54B2VWBq5c',
//     appId: '1:172909494619:ios:72e669d527cac8b15e5a7e',
//     messagingSenderId: '172909494619',
//     projectId: 'firstapp-62132',
//     storageBucket: 'firstapp-62132.appspot.com',
//     iosBundleId: 'com.example.firstAppLpu',
//   );
//
//   static const FirebaseOptions macos = FirebaseOptions(
//     apiKey: 'AIzaSyBHu4AHG1gH7H6K6toWv0R2M54B2VWBq5c',
//     appId: '1:172909494619:ios:72e669d527cac8b15e5a7e',
//     messagingSenderId: '172909494619',
//     projectId: 'firstapp-62132',
//     storageBucket: 'firstapp-62132.appspot.com',
//     iosBundleId: 'com.example.firstAppLpu',
//   );
//
//   static const FirebaseOptions windows = FirebaseOptions(
//     apiKey: 'AIzaSyAGoN1gZtCHp0Ytl-PQl4e5W_0Oo954434',
//     appId: '1:172909494619:web:752a4cb2046f69705e5a7e',
//     messagingSenderId: '172909494619',
//     projectId: 'firstapp-62132',
//     authDomain: 'firstapp-62132.firebaseapp.com',
//     storageBucket: 'firstapp-62132.appspot.com',
//     measurementId: 'G-NR304N5X81',
//   );
//
// }