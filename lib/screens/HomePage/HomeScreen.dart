import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase1/screens/Authentication/AuthScreen.dart';
import 'package:firebase1/screens/Authentication/controller.dart';
import 'package:firebase1/screens/HomePage/homeController/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../components/CarouselCont.dart';
import '../../components/animated_indicator.dart';
import '../../components/customBottomNav.dart';
import '../../consts/style.dart';

class HomeScreen extends StatelessWidget{
  final con=Get.put(HomeController());
  final controller=Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 140,
                    width: 150,
                    child: Image.asset('assets/images/logo11.png'),
                  ),
                  Row(
                    children:[
                      Column(
                        children: [
                          SizedBox(
                            height: 100,
                            width: 150,
                            child: Image.asset('assets/images/charity_logo.png'),
                          ),
                          Text("The Armed Forces",style:TextStyle(color: M.blackColor,fontSize: 12,fontWeight: FontWeight.w400),)
                        ],
                      ),
                      SizedBox(width: 25,),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40,),
              CarouselSlider(
                items: [
                  CarouselCont(img: "https://media.istockphoto.com/id/1412618508/photo/woman-putting-her-clothes-in-a-delivery-box.webp?b=1&s=170667a&w=0&k=20&c=6f9MlaZWaS1NeGXFjHU3wwK_YTWYi9a32YT6JlCsX9w=",),
                CarouselCont(img:"https://thumbs.dreamstime.com/b/holding-clothing-donation-box-used-clothes-doll-home-to-support-help-poor-people-world-236293244.jpg"),
                //  CarouselCont(img:"https://img.freepik.com/premium-photo/holding-clothing-donation-box-with-used-clothes-doll-home-support-help-poor-people-world_39768-5318.jpg"),
                  CarouselCont(img:"https://media.istockphoto.com/id/1396160859/photo/baby-and-child-clothes-toys-in-box-second-hand-apparel-idea-circular-fashion-donation-charity.webp?b=1&s=170667a&w=0&k=20&c=S5EA0TWjsGw1d-6BY3e5blMP1W5TP8uBxCeKD9nEzE4="),

                 // CarouselCont(img:"https://thumbs.dreamstime.com/z/young-woman-clothes-donation-portrait-37393586.jpg",)
                ],
                options: CarouselOptions(
                  onPageChanged: (index, r) {
                    con.onChangePage(index);
                  },
                  height: 350,
                  aspectRatio: 1.0,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                ),
              ),
              SizedBox(height: 15,),
              Obx(() => AnimatedIndicator(currentIndex:con.currentIndex.value)),
              SizedBox(height: 30,),
              GestureDetector(
                onTap:(){
                  con.DonateAuth();
                } ,
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width-30,
                  decoration: BoxDecoration(
                    color:  M.primaryColor,
                    borderRadius:BorderRadius.circular(20),
                  ),
                  child:
                  Center(child: Text("DonateClothes".tr,style: TextStyle(color:M.whiteColor,fontWeight: FontWeight.bold,fontSize: 25),)),
                ),
              ),
            ],
          ),
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

