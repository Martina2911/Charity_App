import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consts/style.dart';
import '../screens/Authentication/controller.dart';

class customCont extends StatelessWidget {
  final Icon icon;
  final Function() onPressed;
  final text;
  const customCont({
    super.key, required this.icon, required this.onPressed, this.text,

  });


  @override
  Widget build(BuildContext context) {
    return Container(
     height: 70,
      width: 170,
      decoration: BoxDecoration(
        color: M.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: M.primaryColor, width: 3.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 3,),
          IconButton(onPressed: onPressed, icon: icon),
          Text(text),
        ],
      )

    );
  }
}