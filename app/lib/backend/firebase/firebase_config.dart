import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA1Lou82y9dOLlegQuCUsWT_ZtxlZXW2os",
            authDomain: "etikete-3b367.firebaseapp.com",
            projectId: "etikete-3b367",
            storageBucket: "etikete-3b367.appspot.com",
            messagingSenderId: "364818987476",
            appId: "1:364818987476:web:81d6c01a2095e548c3fe41"));
  } else {
    await Firebase.initializeApp();
  }
}
