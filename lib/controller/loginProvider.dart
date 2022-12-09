import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authprovider = Provider(((ref) => Auth())); // Creating Auth Provider  using riverpod state management solution

class Auth {
  Future<String> login(String email, String password) async { // creating login function for signing with Email and Password in Firebase.
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "Successfully";
    } on AsyncLoading {
      return "Loading";
    } on FirebaseAuthException catch (err) {
      return "$err";
    }
  }

  Future<String> signup(String email, String password) async { // creating signup function for creating user with Email and Password.
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return "Successfully";
    } on FirebaseAuthException catch (err) {
      return "$err";
    }
  }

  Future<String> logout() async { // creating logout function for signing out.
    try {
      FirebaseAuth.instance.signOut();
      return "Success";
    } on FirebaseException catch (err) {
      return "$err";
    }
  }
}
