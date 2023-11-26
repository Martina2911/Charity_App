
import 'package:firebase1/screens/Authentication/controller.dart';
import 'package:firebase1/screens/Details/Detailsscreen.dart';
import 'package:firebase1/screens/SignInScreen/SignInScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../components/customTextField.dart';
import '../../consts/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(backgroundColor: M.primaryColor,title: Text("DonateWithLove".tr),centerTitle: true,
        actions: [
          IconButton(onPressed:(){Get.to(DetailScreen());}, icon: Icon(Icons.arrow_forward))
        ],
      ),
      body:
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        SizedBox(height: 40,),
        Center(child:
        ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(
              border:Border.all(
                  color: M.primaryColor,
                  width: 5
              ),
            ),
             child: SvgPicture.asset("assets/images/charityContact.svg"),
             // child: Image.network("https://static.vecteezy.com/system/resources/previews/004/588/667/non_2x/heart-in-hand-line-icon-outline-sign-linear-pictogram-isolated-on-white-health-love-and-relationship-symbol-logo-illustration-charity-and-donation-line-icon-concept-free-vector.jpg"),
            ),
            ),),
            SizedBox(height: 40,),
            Center(
              child: customTextfield(controller: controller, width: 360.0, hintText: "Email", labelText: "Email",TextEditingController: controller.emailController,),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
             child: customTextfield(controller: controller, width:360.0, hintText: "Password", labelText: "Password", TextEditingController: controller.passwordController,),
            ),
            SizedBox(height: 20,),
             ElevatedButton(
               style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all<Color?>(M.primaryColor),             ),
                 onPressed:(){ controller.signUp();}, child: Text("SignUp".tr)),
            SizedBox(height: 100,),
            Row( mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("AlreadyHaveAnAccount?".tr,
                  style: TextStyle(color: M.blackColor,fontSize: 17),),
                GestureDetector(
                  onTap: (){
                    Get.to(SignIn());
                  },
                  child:  Text(" SignIn".tr,
                    style: TextStyle(color: M.primaryColor,fontSize: 17),),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}




/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'authServices.dart';
import 'controller.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    final ser=AuthServices();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign Up'),
              TextField(
                controller: controller.emailController,
                decoration: const InputDecoration(hintText: 'email'),
              ),
              TextField(
                controller: controller.passwordController,
                decoration: InputDecoration(hintText: 'password '),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    // ser.deleteAccount();
                    // ser.signOut();
                     //ser.delete();
                    controller.signUp();
                  },
                  child: Text('Sign Up'))
            ],
          ),
        ),
      ),
    );
  }
}


 */