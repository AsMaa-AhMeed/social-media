import 'package:assignment_course/servcies/firebase_authentcation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: const Text('Sign out'),
        onPressed: () async {
          await Auth.instance.signOut();
        },
      )),
    );
  }
}
