import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consts/style.dart';
import '../screens/Authentication/controller.dart';

class customTextfield extends StatelessWidget {
  final width;
  final hintText;
  final labelText;
  final height;
  final TextEditingController;
  const customTextfield({
    super.key,
    required this.controller, required this.width, required this.hintText,required this.labelText, this.height, required this.TextEditingController,
  });

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: TextEditingController,
        decoration: InputDecoration(
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey),
          labelText: labelText,
          labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color:Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: M.primaryColor, width: 3.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: M.primaryColor,
                width: 2.0), // Set the color of the focused border
          ),
        ),
      ),
    );
  }
}