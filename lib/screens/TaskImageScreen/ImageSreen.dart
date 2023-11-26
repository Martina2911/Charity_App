import 'dart:io';

import 'package:firebase1/screens/TaskImageScreen/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';

import 'carouselImageScreen.dart';
import 'controller.dart';

class ImageScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ImageServices ds=ImageServices();
    ImageController controller =Get.put(ImageController());
   return Scaffold(
     body:Column( mainAxisAlignment: MainAxisAlignment.center,
         children:[
     Obx(()=>
       controller.image.value.isEmpty ?
       Stack(
           children: [
             Center(child: ClipRRect(
               borderRadius: BorderRadius.circular(20),
               child: Container(
                 height: 300,
                 width: 400,
                 decoration: BoxDecoration(
                   border:Border.all(
                       color: Colors.green,
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
                 child: GestureDetector(
                   onTap: () {
                     showModalBottomSheet(
                         backgroundColor: Colors.white,
                         shape: const RoundedRectangleBorder(
                             borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
                         context: context,
                         builder: (BuildContext context) {
                           return SizedBox(
                               height: 200,
                               child: Column(children:
                               [
                                 const SizedBox(height: 10,),
                                 const Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children:[
                                       Text("Add Image",style: TextStyle(color:Colors.green,fontSize: 20),),
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
                                           primary: Colors.green,
                                         ),
                                         onPressed: () {
                                           controller.selectImage(source: ImageSource.gallery);
                                         },
                                         child: const Row(
                                             mainAxisAlignment:MainAxisAlignment.center,
                                             children:[
                                               Icon(Icons.image_outlined,size: 20.0, color: Colors.white),
                                               SizedBox(width:5),
                                               Text('From Gallery', style: TextStyle(fontSize: 15.0, color: Colors.white),
                                               )]),
                                       ),
                                     ),
                                     Container(
                                       width: 170.0,
                                       height: 50.0,
                                       child: ElevatedButton(
                                         style:
                                         ElevatedButton.styleFrom(
                                           primary: Colors.green,
                                         ),
                                         onPressed: () {
                                           controller.selectImage(source: ImageSource.camera);
                                         },
                                         child: const Row(
                                             mainAxisAlignment:MainAxisAlignment.center,
                                             children:[
                                               Icon(Icons.camera_alt_outlined,size: 20.0, color: Colors.white),
                                               SizedBox(width:5),
                                               Text('From Camera', style: TextStyle(fontSize: 15.0, color: Colors.white),
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
                       color: Colors.white,
                       shape: BoxShape.circle,
                       border: Border.all(
                         color: Colors.green,
                         width: 5.0,
                       ),
                     ),
                     child: Icon(
                       Icons.add,
                       color: Colors.green,
                       size: 50.0,
                     ),
                   ),
                 ))
           ]):
       Center(child:
       ClipRRect(
         borderRadius: BorderRadius.circular(20),
         child:
         Container(
           height: 300,
           width: 400,
           decoration: BoxDecoration(
             border:Border.all(
                 color: Colors.green,
                 width: 5
             ),
           ),
           child: Image.file(
             File(controller.image.value.toString()),
             width: 300,
             height: 400.0,
             fit: BoxFit.cover,
           ),
         ),),),),
       SizedBox(height: 100,),
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           ElevatedButton(
               style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all<Color?>(Colors.green),             ),
               onPressed:(){controller.addToFireStore();}, child: Text("Add to FireStore")),
           SizedBox(width: 20,),
           ElevatedButton(
               style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all<Color?>(Colors.green),             ),
               onPressed:(){
                 ds.uploadImageToStorage(imagePath: controller.image.value);
               }, child: Text("Add image")),
           SizedBox(width: 20,),
           ElevatedButton(
               style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all<Color?>(Colors.green),             ),
               onPressed:(){
                 controller.addToRealTime();
               }, child: Text("Add RealTime")),
         ],
         
       ),
           ElevatedButton(
               style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all<Color?>(Colors.green),             ),
               onPressed:(){
                Get.to(ImageSliderScreen());
               }, child: Text("Carousel Screen")),
    ])
   );
  }

}