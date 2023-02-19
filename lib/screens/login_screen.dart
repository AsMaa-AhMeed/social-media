import 'package:assignment_course/manager/color_manager.dart';
import 'package:assignment_course/screens/facebook_screen.dart';
import 'package:assignment_course/servcies/firebase_authentcation.dart';
import 'package:assignment_course/widgets/custom_text_form_feild.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              Center(
                child: Lottie.asset('assets/animation/hello.json', height: 300),
              ),
              CustomTextField(
                controller: emailController,
                hintText: 'Email',
                preIcon: const Icon(Icons.email_rounded),
                inputType: TextInputType.emailAddress,
              ),
              CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                preIcon: const Icon(Icons.remove_red_eye_outlined),
                inputType: TextInputType.visiblePassword,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () async {
                      final email = emailController.text;
                      final password = passwordController.text;
                      final userCredential = await Auth.instance
                          .createEmailAndPassword(email, password, context);
                      if (userCredential != null) {
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(userCredential.user!.uid)
                            .set({'email': email});
                      }

                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const FaceBookScreen();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 4,
                        padding: const EdgeInsets.all(16),
                        shape: const StadiumBorder(),
                        disabledBackgroundColor: ColorManager.darkBlue,
                        disabledForegroundColor: ColorManager.white),
                    child: const Text(
                      'LOGIN',
                      style:
                          TextStyle(fontFamily: 'AbrilFatface', fontSize: 18),
                    )),
              )
            ],
          ),
        ));
  }
}
