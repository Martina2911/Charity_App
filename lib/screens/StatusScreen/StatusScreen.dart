import 'package:firebase1/screens/Authentication/controller.dart';
import 'package:firebase1/screens/HomePage/HomeScreen.dart';
import 'package:firebase1/screens/StatusScreen/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/style.dart';
import '../TrackOrderScreen/controller.dart';

class StatusScreen extends StatelessWidget{
  final name;
  final index;
  final address;
  final piece;
  final appartno;
  final special;
  final date;
  final time;
  final imgurl;
  final status;
  StatusScreen({required this.name,required this.index,
    required this.address,required this.piece,required this.appartno,required this.special,required this.date,required this.time,required this.imgurl,required this.status});


  StatusController con=Get.put(StatusController());
  AllDetailController conn=Get.put(AllDetailController());
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(backgroundColor: M.primaryColor,title: Text("Order Details".tr,style: TextStyle(fontSize: 25,color: M.whiteColor,fontWeight: FontWeight.bold),),centerTitle: true,),
    body: SafeArea(
      child: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 10,),
              Text("Email:".tr,style: TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.bold),),
              SizedBox(width:10,),
              Text("Tina",style: TextStyle(fontSize: 20,color: M.primaryColor,fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: 12,),
    Row(
      children: [
        SizedBox(width: 10,),
        Text("Address:".tr,style: TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.bold),),
        SizedBox(width: 10,),
        Text("$address",style:
        TextStyle(fontSize: 20,color: M.primaryColor,fontWeight: FontWeight.bold),),
      ],),
          SizedBox(height: 12,),
          Row(
            children: [
              SizedBox(width: 10,),
              Text("AppNo:".tr,style: TextStyle(fontSize: 20,color:  Colors.grey,fontWeight: FontWeight.bold),),
              SizedBox(width: 10,),
              Text("$appartno",style:
              TextStyle(fontSize: 20,color: M.primaryColor,fontWeight: FontWeight.bold),),
            ],),
          SizedBox(height: 12,),
          Row(
            children: [
              SizedBox(width: 10,),
              Text("SpecialMark:".tr,style:
              TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.bold),),
              SizedBox(width: 10,),
              Text("$special",style:
              TextStyle(fontSize: 20,color: M.primaryColor,fontWeight: FontWeight.bold),),
            ],),
          SizedBox(height: 12,),
          Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: M.primaryColor, width: 3.0),
                  boxShadow: [
                    BoxShadow(
                      color: M.primaryColor.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),

                    )]
              ),
              child:
              Row(
                children:
                [
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 160,
                        decoration: BoxDecoration(
                          color: M.whiteColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: M.primaryColor, width: 3.0),
                        ),
                        child: Center(
                          child: Image.network(imgurl!, fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(width: 15),
                    ],
                  ),
                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                    children: [
                      SizedBox(height: 18,),
                      Row(
                        children: [
                          Text("Date:",style: TextStyle(fontSize: 22,color:  Colors.grey,fontWeight: FontWeight.bold),),
                          SizedBox(width: 10,),
                          Text(" ${date!.contains("00") ? date?.substring(0, date?.indexOf('00')) :date}",
                            style: TextStyle(color: M.primaryColor,fontSize: 18,fontWeight: FontWeight.bold),
                              ) ],),
                          SizedBox(height: 30),
                      Row(
                        children: [
                          Text("Time:",style: TextStyle(fontSize: 22,color:  Colors.grey,fontWeight: FontWeight.bold),),
                          SizedBox(width: 10,),
                          Text(" ${time}",style: TextStyle(color: M.primaryColor,fontSize: 18,fontWeight: FontWeight.bold),),],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Text("Status:",style: TextStyle(fontSize: 22,color:  Colors.grey,fontWeight: FontWeight.bold),),
                          SizedBox(width: 10,),
                          Text(" ${status}",style: TextStyle(color: M.primaryColor,fontSize: 18,fontWeight: FontWeight.bold),),],
                      ),

                    ],
                  ),
                ]),
  ),
          SizedBox(height: 300,),
          GestureDetector(
            onTap:(){
              Get.to(HomeScreen());},
            child: Container(
              height: 30,
              width: 120,
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
                borderRadius:BorderRadius.circular(5),
                border: Border.all(color: M.primaryColor),
              ),
              child:
              Center(child: Text("Done".tr,style: TextStyle(color:M.whiteColor,fontWeight: FontWeight.w400,fontSize: 16),)),
            ),
          ),
        ]
      ),
    ),
  );
  }

}