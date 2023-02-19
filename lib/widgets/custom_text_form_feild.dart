import 'package:assignment_course/manager/color_manager.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  String? hintText;
  TextInputType? inputType;
  Widget? preIcon;
  Widget? sufIcon;
  bool security;
  String? Function(String?)? validator;
  CustomTextField(
      {required this.hintText,
      this.inputType,
      this.preIcon,
      this.security = false,
      this.sufIcon,
      this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsetsDirectional.fromSTEB(20, 18, 20, 0),
      //  padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: inputType,
        obscureText: security,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: ColorManager.lightBlack,
            fontSize: 14,
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          filled: true,
          fillColor: ColorManager.lightGray,
          focusColor: ColorManager.lightBlue,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.lightGray),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.lightBlue),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          prefixIcon: preIcon,
          suffixIcon: sufIcon,
        ),
      ),
    );
  }
}
