import 'package:flutter/material.dart';

class ColorManager {
  static const Color lightBlue = Color(0xFF246BFD);
  static const Color darkBlue = Color(0xFF4267B2);
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkWhite = Color(0xFFFAFAFA);
  static const Color darkBlack = Color(0xFF000000);
  static const Color lightBlack = Color(0xFF181A20);
  static const Color lightGray = Color(0xFFFAFAFA);
  static const Color grey = Colors.grey;
  static const Color scaffold = Color(0xFFF0F2F5);
  static const LinearGradient createRoomGradient =
      LinearGradient(colors: [Color(0xFF496AE1), Color(0xFFCE48B1)]);
  static const Color online = Color(0xFF4BCB1F);
  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );
}
