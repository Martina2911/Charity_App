
import 'package:firebase1/screens/Authentication/AuthScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../components/customTextField.dart';
import '../../consts/style.dart';
import '../Authentication/controller.dart';
import '../Details/Detailsscreen.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(backgroundColor: M.primaryColor,title: Text("SignIn".tr),centerTitle: true,
        actions: [
          IconButton(onPressed:(){Get.to(DetailScreen());}, icon: Icon(Icons.arrow_forward))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: customTextfield(controller: controller, width: 360.0, hintText: "Email".tr, labelText: "Email".tr,TextEditingController: controller.emailController2,),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: customTextfield(controller: controller, width:360.0, hintText: "Password".tr, labelText: "Password".tr, TextEditingController: controller.passwordController2,),
          ),
          SizedBox(height: 100,),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color?>(M.primaryColor),             ),
              onPressed:(){ controller.signIn();}, child: Text("SignIn".tr)),
          SizedBox(height: 100,),
          Row( mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("DontHaveAnAccount?".tr,
                style: TextStyle(color: M.blackColor,fontSize: 17),),
              GestureDetector(
                onTap: (){
                  Get.to(AuthScreen());
                },
                child:  Text("SignUp".tr,
                  style: TextStyle(color: M.primaryColor,fontSize: 17),),
              )
            ],
          ),
        ],
      ),
    );
  }
}