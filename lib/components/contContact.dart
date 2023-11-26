import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../consts/style.dart';
import '../screens/ContactScreen/controller.dart';

class ContContact extends StatelessWidget {
  final IconData icon;
  final String text;
  const ContContact({
    super.key,
    required this.con, required this.icon, required this.text,
  });
  final Controller con;
  @override
  Widget build(BuildContext context) {
    return
      Container(
      height: 60,
      width: 400,
      decoration: BoxDecoration(
        color: M.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 3,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius:BorderRadius.circular(20),
        border: Border.all(color: M.primaryColor),
      ),
    child: Padding(
    padding:EdgeInsets.all(8.0),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 10,),
          Icon(
            icon,
            size: 30,
            color: M.primaryColor,
          ),
          SizedBox(width: 20,),
          GestureDetector(
            onTap: (){
              con.launcher(text);
            },
            child:Text(
              text,
              style: TextStyle(
                fontSize: 15,
              ),
              maxLines: 1, // Maximum number of lines before ellipsizing
              overflow: TextOverflow.ellipsis, // Ellipsis (...) when text overflows
             // Center-align the text
            ),),
        ],
      ),),
    );
  }
}