import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consts/style.dart';
import '../screens/Authentication/controller.dart';

class customTextfield2 extends StatelessWidget {
  final width;
  final hintText;
  final labelText;
  final height;
  final controller;
  final icon;
  const customTextfield2({
    super.key,
  required this.width, required this.hintText,required this.labelText, this.height,required this.controller, this.icon,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: M.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: M.primaryColor, width: 3.0),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: icon,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey
            ),
          labelText: labelText,
          labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
             color: Colors.grey
          ),
        /*  enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),*/
          ),
          /*focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.green,
                width: 2.0), // Set the color of the focused border
          ),*/
        ),

    );
  }
}