import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCh_g8ATP5pEO_pFUfvxHyG2uQUF_rWLA0",
            authDomain: "opo-finance-i6ths1.firebaseapp.com",
            projectId: "opo-finance-i6ths1",
            storageBucket: "opo-finance-i6ths1.appspot.com",
            messagingSenderId: "393590519653",
            appId: "1:393590519653:web:4ea547a800997b8f4b938c"));
  } else {
    await Firebase.initializeApp();
  }
}
