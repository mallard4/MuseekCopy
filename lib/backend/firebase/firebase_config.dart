import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBo9XU7Po7HCsRHoaPXMuG38dgpgAcCrFs",
            authDomain: "museek-8bcf7.firebaseapp.com",
            projectId: "museek-8bcf7",
            storageBucket: "museek-8bcf7.appspot.com",
            messagingSenderId: "148065457630",
            appId: "1:148065457630:web:2acd9525e74aa69baff94f",
            measurementId: "G-R0SQRD64D5"));
  } else {
    await Firebase.initializeApp();
  }
}
