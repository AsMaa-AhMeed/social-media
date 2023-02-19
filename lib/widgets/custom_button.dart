import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  VoidCallback? onPressed;
  String? data;
  CustomButton({this.onPressed, this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
          ),
          onPressed: onPressed,
          child: Text(
            data!,
            style: TextStyle(fontSize: 24),
          )),
    );
  }
}
