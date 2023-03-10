import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// class Auth {
//   Auth._();

//   static final _object = Auth._();

//   // static Auth get instance => _object;
//   // Future<UserCredential> signInWithGoogle() async {
//   //   // Trigger the authentication flow
//   //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   //   // Obtain the auth details from the request
//   //   final GoogleSignInAuthentication? googleAuth =
//   //       await googleUser?.authentication;

//   //   // Create a new credential
//   //   final credential = GoogleAuthProvider.credential(
//   //     accessToken: googleAuth?.accessToken,
//   //     idToken: googleAuth?.idToken,
//   //   );
// //}
// }

class Auth {
  Auth._();

  static final _object = Auth._();

  static Auth get instance => _object;

  final user = FirebaseAuth.instance.currentUser;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential?> createEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Your Email is already Exist!'),
        backgroundColor: Colors.red,
      ));
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on Exception catch (e) {
      print('The error in: $e');
    }
  }
}
