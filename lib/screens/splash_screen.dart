import 'package:assignment_course/screens/screens.dart';
import 'package:assignment_course/servcies/firebase_authentcation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 5000), () {
      if (Auth.instance.user == null) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return WelcomeScreen();
          }),
        );
      } else {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return AssignmentScreen();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/animation/welcome.json'),
      ),
    );
  }
}
