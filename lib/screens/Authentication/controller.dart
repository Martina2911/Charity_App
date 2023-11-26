import 'package:firebase1/screens/Authentication/AuthScreen.dart';
import 'package:firebase1/screens/Authentication/authServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/style.dart';
import '../../helper/cache_helper.dart';
import '../Details/Detailsscreen.dart';

class AuthController extends GetxController{
 TextEditingController emailController =TextEditingController();
 TextEditingController passwordController=TextEditingController();
 TextEditingController emailController2 =TextEditingController();
 TextEditingController passwordController2=TextEditingController();

 AuthServices ser=AuthServices();

 signUp() async {
   String email = emailController.text;
   String password = passwordController.text;
   await ser.signUp(email:email,pass: password);
    Get.to(DetailScreen());
   print('${emailController.text}');
 }
 signIn()async{
   await ser.signIn(email:emailController2.text,pass: passwordController2.text);
   print('Todo:${emailController.text}');
    Get.to(DetailScreen());
 }

 signOut() async{
   await ser.signOut();
 }

 delete()async{
   await ser.delete();
 }

}