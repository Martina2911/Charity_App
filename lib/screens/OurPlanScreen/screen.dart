import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../components/customBottomNav.dart';
import '../../consts/style.dart';
import '../HomePage/homeController/controller.dart';

class OurPlan extends StatelessWidget{
  final con =Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: M.primaryColor,title: Text("OurPlan".tr,style: TextStyle(fontSize: 25,color: M.whiteColor,fontWeight: FontWeight.bold),),centerTitle: true,),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align the main column to the top
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Center(child: Text("CharityApp".tr,style: TextStyle(color: M.primaryColor,fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align the content inside the column to the left
                children: [
                  Text("OurVision".tr, style: TextStyle(color: M.primaryColor, fontWeight: FontWeight.bold, fontSize: 15,)),
                  SizedBox(height: 10,),
                  Text(
                    "Our vision is based on the satisfaction of our dear donors and improving their experience by providing the best way to communicate with ease and at the level of the Hashemite Kingdom of Jordan only, so everything we plan for in our future strategic plans focuses on achieving this goal. ".tr,
                    style: TextStyle(color: M.blackColor, fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(height: 30,),
                  Text("OurPlan".tr, style: TextStyle(color: M.primaryColor, fontWeight: FontWeight.bold, fontSize: 15)),
                  SizedBox(height: 10,),
                  Text(
                    "And because Charity clothes is for the people and for the people, we seek through our new vision and goals to contribute significantly to raising the standard of living in the community and the region. Believing that the stability of our work today is the growth and prosperity of the region tomorrow. We are keen to be the name you can always rely on ".tr,
                    style: TextStyle(color: M.blackColor, fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
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