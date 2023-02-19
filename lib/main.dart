import 'package:assignment_course/firebase_options.dart';
import 'package:assignment_course/manager/color_manager.dart';
import 'package:assignment_course/screens/login_screen.dart';
import 'package:assignment_course/screens/welcome_screen.dart';
import 'package:assignment_course/screens/facebook_screen.dart';
import 'package:assignment_course/screens/home_facebook_screen.dart';
import 'package:assignment_course/screens/navigate_screen.dart';
import 'package:assignment_course/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: ColorManager.scaffold,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
