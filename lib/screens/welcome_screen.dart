import 'package:assignment_course/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('User Auth Page'), elevation: 0.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton(
              Buttons.Google,
              onPressed: () async {
                await signInWithGoogle();
              },
            ),
            SignInButton(
              Buttons.Facebook,
              onPressed: () async {
                await signInWithFacebook();
              },
            ),
            SignInButton(
              Buttons.Email,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }),
                );
                // try {
                //   final signInMethods = await FirebaseAuth.instance
                //       .fetchSignInMethodsForEmail('asmaaahmed@gmail.com');
                //   final userExists = signInMethods.isNotEmpty;
                //   final canSignInWithLink = signInMethods
                //       .contains(EmailAuthProvider.EMAIL_LINK_SIGN_IN_METHOD);
                //   final canSignInWithPassword = signInMethods.contains(
                //       EmailAuthProvider.EMAIL_PASSWORD_SIGN_IN_METHOD);
                // } on FirebaseAuthException catch (exception) {
                //   switch (exception.code) {
                //     case "invalid-email":
                //       print("Not a valid email address.");
                //       break;
                //     default:
                //       print("Unknown error.");
                //   }
                // }
              },
            )
          ],
        ),
      ),
    );
  }
}
