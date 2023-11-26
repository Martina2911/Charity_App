import 'dart:io';
import 'package:firebase1/screens/Address/AddressScreen.dart';
import 'package:firebase1/screens/Authentication/controller.dart';
import 'package:firebase1/screens/Details/controller.dart';
import 'package:firebase1/screens/Details/services.dart';
import 'package:firebase1/screens/HomePage/HomeScreen.dart';
import 'package:firebase1/screens/TrackOrderScreen/screen.dart';
import 'package:firebase1/screens/splash/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../components/Container.dart';
import '../../components/customTextField2.dart';
import '../../consts/style.dart';
import '../AllDetails/AllDetailsScreen.dart';
import 'package:firebase1/screens/TrackOrderScreen/controller.dart';
import '../Authentication/AuthScreen.dart';
import '../Authentication/authServices.dart';

class DetailScreen extends StatelessWidget{
//double? lat;
//double ?lang;
 String ?notes;
String ?specialMark;
String ?appNo;
double ? lat;
double ? lng;
DetailScreen({Key? key,
  //this.lat,this.lang,
  this.notes,this.specialMark,this.appNo,this.lat,this.lng}) : super(key: key);

  DetailServices ds=DetailServices();
  //AuthController au=AuthController();
 // AuthServices as=AuthServices();
 AllDetailController con =Get.put(AllDetailController());
  DetailController controller=Get.put(DetailController());
  @override
  Widget build(BuildContext context) {
   return GetBuilder<DetailController>(
     init: DetailController(),
       builder:(controller){
     return Scaffold(
       appBar: AppBar(backgroundColor: M.primaryColor,title: Text("DonatedPieceDetails".tr),
         actions: [
        // IconButton(onPressed:(){Get.to(AddressScreen(imageurl: null, noPieces: null, date: null, time: null,));}, icon: Icon(Icons.arrow_forward))
         ],),
       body:
       SingleChildScrollView(
         child:
         Column( mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             SizedBox(height: 40,),
             Obx(()=>
         controller.image.value.isEmpty ?
         Stack(
             children: [
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
           child:Image.network('https://www.transparentpng.com/thumb/photo-camera/ljZlZe-black-icon-photo-camera.png', // Replace with your image URL
             ),
             ),
     ),),
           Positioned(
               right: 50.0,
               bottom: 15.0,
               child:
               GestureDetector(
                   onTap: () {
                     showModalBottomSheet(
                         backgroundColor: M.whiteColor,
                         shape:
                         const RoundedRectangleBorder(
                             borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
                         context: context,
                         builder: (BuildContext context) {
                           return SizedBox(
                               height: 200,
                               child: Column(children:
                               [
                                 const SizedBox(height: 10,),
                                  Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children:[
                                       Text("Add your donated piece",style: TextStyle(color:M.primaryColor,fontSize: 20),),
                                     ]
                                 ),
                                 SizedBox(height: 40,),
                                 Row(
                                   mainAxisAlignment:
                                   MainAxisAlignment.spaceEvenly,
                                   children: [
                                     Container(
                                       width: 170.0,
                                       height: 50.0,
                                       child: ElevatedButton(
                                         style:
                                         ElevatedButton.styleFrom(
                                           primary: M.primaryColor,
                                         ),
                                         onPressed: () {
                                           controller.selectImage(source: ImageSource.gallery);
                                         },
                                         child: const Row(
                                             mainAxisAlignment:MainAxisAlignment.center,
                                             children:[
                                               Icon(Icons.image_outlined,size: 20.0, color:M.whiteColor),
                                               SizedBox(width:5),
                                               Text('From Gallery', style: TextStyle(fontSize: 15.0, color: M.whiteColor),
                                               )]),
                                       ),
                                     ),
                                     Container(
                                       width: 170.0,
                                       height: 50.0,
                                       child: ElevatedButton(
                                         style:
                                         ElevatedButton.styleFrom(
                                           primary: M.primaryColor,
                                         ),
                                         onPressed: () {
                                           controller.selectImage(source: ImageSource.camera);
                                         },
                                         child: const Row(
                                             mainAxisAlignment:MainAxisAlignment.center,
                                             children:[
                                               Icon(Icons.camera_alt_outlined,size: 20.0, color: M.whiteColor),
                                               SizedBox(width:5),
                                               Text('From Camera', style: TextStyle(fontSize: 15.0, color: M.whiteColor),
                                               )]),
                                       ),
                                     )
                                   ],
                                 )]));
                         });
                   },
                   child: Container(
                     width: 70.0,
                     height: 70.0,
                     decoration: BoxDecoration(
                       color: M.whiteColor,
                       shape: BoxShape.circle,
                       border: Border.all(
                         color: M.primaryColor,
                         width: 5.0,
                       ),
                      ),
                     // child:const CircleAvatar(
                     // backgroundColor: Colors.white,
                     // radius: 20.0,
                     child: Icon(
                       Icons.add,
                       color: M.primaryColor,
                       size: 50.0,
                     ),
                   ),
                   ))
           ]
         ):
           Center(
             child:
           ClipRRect(
           borderRadius: BorderRadius.circular(20),
           child:
           Container(
           height: 300,
           width: 400,
           decoration: BoxDecoration(
           border:Border.all(
           color: M.primaryColor,
           width: 5
           ),
           ),
           child: GestureDetector(
             onTap: () {
               showModalBottomSheet(
                   backgroundColor: M.whiteColor,
                   shape: const RoundedRectangleBorder(
                       borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
                   context: context,
                   builder: (BuildContext context) {
                     return SizedBox(
                         height: 200,
                         child: Column(children:
                         [
                           const SizedBox(height: 10,),
                           Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children:[
                                 Text("Add your donated piece",style: TextStyle(color:M.primaryColor,fontSize: 20),),
                               ]
                           ),
                           SizedBox(height: 40,),
                           Row(
                             mainAxisAlignment:
                             MainAxisAlignment.spaceEvenly,
                             children: [
                               Container(
                                 width: 170.0,
                                 height: 50.0,
                                 child: ElevatedButton(
                                   style:
                                   ElevatedButton.styleFrom(
                                     primary: M.primaryColor,
                                   ),
                                   onPressed: () {
                                     controller.selectImage(source: ImageSource.gallery);
                                   },
                                   child: const Row(
                                       mainAxisAlignment:MainAxisAlignment.center,
                                       children:[
                                         Icon(Icons.image_outlined,size: 20.0, color:M.whiteColor),
                                         SizedBox(width:5),
                                         Text('From Gallery', style: TextStyle(fontSize: 15.0, color: M.whiteColor),
                                         )]),
                                 ),
                               ),
                               Container(
                                 width: 170.0,
                                 height: 50.0,
                                 child: ElevatedButton(
                                   style:
                                   ElevatedButton.styleFrom(
                                     primary: M.primaryColor,
                                   ),
                                   onPressed: () {
                                     controller.selectImage(source: ImageSource.camera);
                                   },
                                   child: const Row(
                                       mainAxisAlignment:MainAxisAlignment.center,
                                       children:[
                                         Icon(Icons.camera_alt_outlined,size: 20.0, color: M.whiteColor),
                                         SizedBox(width:5),
                                         Text('From Camera', style: TextStyle(fontSize: 15.0, color: M.whiteColor),
                                         )]),
                                 ),
                               )
                             ],
                           )]));
                   });
             },
           child: Image.file(
           File(controller.image.value.toString()),
           width: 300,
           height: 400.0,
           fit: BoxFit.cover,
           ),
           ),),),),),
             SizedBox(height: 40,),
             customTextfield2(controller:controller.numOfPieces,width: 360.0, hintText: "NoPieces".tr, labelText: "EnterNoOfPieces".tr,),
             SizedBox(height: 30,),
             customTextfield2(icon:IconButton(onPressed: () async { Get.to(AddressScreen()); }, icon: Icon(Icons.location_on_outlined),),controller: controller.address,width: 360.0, hintText: "Address".tr, labelText: "EnterYouraddress".tr,),
             SizedBox(height: 30,),
             Row(mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 customCont(
                   icon: Icon(Icons.calendar_month_outlined, size: 30,color: Colors.grey,),
                   onPressed: () async {await controller.selectDateFunc(context);},
                   text: controller.selectedDate != null ? '${DateFormat('yyyy-MM-dd').format(controller.selectedDate!)}' : "",
                 ),
                 SizedBox(width: 20,),
                 customCont(
                   icon: Icon(Icons.alarm, size: 30,color: Colors.grey,),
                   onPressed: () async {
                     await controller.selectTimeFunc(context);},
                      text: controller.selectedTime != null ?
                      '${controller.selectedTime!.format(context)}' : "",
                 ),
               ],),
             SizedBox(height: 20,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 ElevatedButton(
                     style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all<Color?>(M.primaryColor),             ),
                     onPressed:(){
                       controller.addToFireStore(appNo:this.appNo,specialMark:this.specialMark,notes:this.notes,lat:this.lat,lng:this.lng);
                      // Get.to(HomeScreen());
                       }, child: Text("AddToFirestore".tr)),
               //  SizedBox(width: 20,),
                 // ElevatedButton(
                 //     style: ButtonStyle(
                 //       backgroundColor: MaterialStateProperty.all<Color?>(M.primaryColor),             ),
                 //     onPressed:() {
                 //       // au.SignOut();
                 //       // Get.to(SplashScreen());
                 //
                 //     }, child: Text("Store Image")),
               //  SizedBox(width: 20,),
                 // ElevatedButton(
                 //     style: ButtonStyle(
                 //       backgroundColor: MaterialStateProperty.all<Color?>(M.primaryColor),             ),
                 //     onPressed:(){
                 //       controller.addToRealTime(appNo:this.appNo,specialMark:this.specialMark,notes:this.notes,lat:this.lat,lng:this.lng);
                 //     }, child: Text("Add RealTime")),
               ],
             ),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
        onTap:(){
       con.getAllData();
       Get.to(GetAllDetailScreen());},
         child: Container(
           height: 30,
           width: 80,
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
           Center(child: Text("Details".tr,style: TextStyle(color:M.whiteColor,fontWeight: FontWeight.w400,fontSize: 16),)),
         ),
       ),
        SizedBox(width: 15,),
        // GestureDetector(
        //   onTap:(){
        //     controller.deleteData(index: controller.index);
        //     },
        //   child: Container(
        //     height: 30,
        //     width: 80,
        //     decoration: BoxDecoration(
        //       color: M.primaryColor,
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.grey.withOpacity(0.5), // Shadow color
        //           spreadRadius: 3,
        //           blurRadius: 4,
        //           offset: Offset(0, 2),
        //         ),
        //       ],
        //       borderRadius:BorderRadius.circular(5),
        //       border: Border.all(color: M.primaryColor),
        //     ),
        //     child:
        //     Center(child: Text("Delete",style: TextStyle(color:M.whiteColor,fontWeight: FontWeight.w400,fontSize: 16),)),
        //   ),
        // ),
        ]
    ),
           ],),
       )
     );
   });
  }
}