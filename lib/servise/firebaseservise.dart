import 'package:firebase_auth/firebase_auth.dart';

class Authservise{

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential>login({
        required String emails,
        required String passwords
      }) {
    return firebaseAuth.signInWithEmailAndPassword(
      email: emails.trim(),
      password: passwords.trim(),
    );
  }
  }