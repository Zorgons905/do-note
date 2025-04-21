import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQycdjD4Gx1mfVns5wqYI7wmUUKPfOjH8',
    appId: '1:175979610480:android:4907af0139d3e0ff88cfb5',
    messagingSenderId: '175979610480',
    projectId: 'donote-eb782',
    storageBucket: 'donote-eb782.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAebyy_QBlPrwqZCpi1UwV_tGJYkCYV8ok',
    appId: '1:175979610480:ios:85345d71cecad09688cfb5',
    messagingSenderId: '175979610480',
    projectId: 'donote-eb782',
    storageBucket: 'donote-eb782.firebasestorage.app',
    iosBundleId: 'com.example.donote',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCVpoUFltc-BiLoDukTuGUyyE_FEg_0bew',
    appId: '1:175979610480:web:d9965832ca6d658488cfb5',
    messagingSenderId: '175979610480',
    projectId: 'donote-eb782',
    authDomain: 'donote-eb782.firebaseapp.com',
    storageBucket: 'donote-eb782.firebasestorage.app',
  );
}
