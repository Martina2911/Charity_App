import 'package:firebase1/components/contContact2.dart';
import 'package:firebase1/components/contContact3.dart';
import 'package:firebase1/screens/Authentication/controller.dart';
import 'package:firebase1/screens/ContactScreen/controller.dart';
import 'package:firebase1/screens/HomePage/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../components/contContact.dart';
import '../../components/customBottomNav.dart';
import '../../consts/style.dart';
import '../Authentication/AuthScreen.dart';
import '../HomePage/homeController/controller.dart';

class Contact extends StatelessWidget{
  Controller con=Get.put(Controller());
  AuthController authController=Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(backgroundColor: M.primaryColor,title: Text("Contact".tr,style: TextStyle(fontSize: 25,color: M.whiteColor,fontWeight: FontWeight.bold),),centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'en',
                child: Text('English'),
              ),
              PopupMenuItem(
                value: 'ar',
                child: Text('العربية'),
              ),
            ],
            onSelected: (value) {
              con.changeLanguage(value);
            },
          ),
        ],),
    body:
    SingleChildScrollView(
      child: Column( mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(height: 30,),
          Text("ContactUs".tr,style: TextStyle(color: M.blackColor,fontSize: 15,fontWeight:FontWeight.w400),),
          SizedBox(height: 15,),
          ContContact2(con: con, icon: Icons.phone, text: '01205798090',),
          SizedBox(height: 20,),
          Text("SocialMedia".tr,style: TextStyle(color: M.blackColor,fontSize: 15,fontWeight:FontWeight.w400),),
          SizedBox(height: 15,),
          ContContact(con: con, icon: Icons.facebook,text: "https://www.facebook.com/CharityClothesApp",),
          SizedBox(height: 10,),
          ContContact3(con: con, icon: Icons.mail,text: "charityclothes565@gmail.com",),
          SizedBox(height: 10,),
          ContContact(con: con, icon:Icons.flutter_dash_sharp,text: "https://instagram.com/charity_clothes_app?",),
          SizedBox(height: 10,),
          //ContContact(con: con, icon: ,text: "https://instagram.com/charity_clothes_app?igshid=MzRlODBiNWFlZA==",),
          GestureDetector(
          onTap:(){
          authController.delete();
          } ,
          child:
          Center(
            child: Container(
              height: 40,
              width: 200,
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
              child:
              Center(child: Text("DeleteAccount".tr,style: TextStyle(color:M.blackColor,fontWeight: FontWeight.w400,fontSize: 13),)),
            ),
          ),),
          SizedBox(height: 210,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap:(){
                  authController.signOut();
                  Get.to(AuthScreen());
                } ,
                child:
                Center(
                  child: Container(
                    height: 40,
                    width: 100,
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
                    child:
                    Center(child: Text("logOut".tr,style: TextStyle(color:M.blackColor,fontWeight: FontWeight.w400,fontSize: 13),)),
                  ),
                ),),
              GestureDetector(
                onTap:(){
            showModalBottomSheet(
            backgroundColor: M.whiteColor,

           context: context, builder: ( BuildContext context){
            return Container(
              height: 200,
              child:
              SingleChildScrollView(
                child: Column(children: [
                  SizedBox(height: 5,),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Send Feedback",
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey),
                      labelText: "Send Feedback",
                      labelStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: (){
                      con.sendFeedback();
                    },
                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        color: M.primaryColor,
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
                      child:
                      Center(child: Text("Send Feedback",style: TextStyle(color:M.whiteColor,fontWeight: FontWeight.w400,fontSize: 18),)),
                    ),
                  )
                ],),
              )
      );}
      );
  },
                child:
                Center(
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      color: M.primaryColor,
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
                    child:
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Icon(Icons.feedback_outlined , color: M.whiteColor,),
                        SizedBox(width: 30,),
                        Center(child: Text("Feedback".tr,style: TextStyle(color:M.whiteColor,fontWeight: FontWeight.w400,fontSize: 18),)),
                      ],
                    ),
                  ),
                ),),
            ],
          )
        ],
      ),
    ),
      bottomNavigationBar:
      GetBuilder<HomeController>(
        builder: (controller) {
          return CustomBottomNav(con: controller);
        },
      )
  );
  }

}

