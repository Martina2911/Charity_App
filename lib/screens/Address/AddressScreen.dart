
import 'dart:async';

import 'package:firebase1/components/customTextField.dart';
import 'package:firebase1/screens/Address/controller.dart';
import 'package:firebase1/screens/AllDetails/AllDetailsScreen.dart';
import 'package:firebase1/screens/Details/Detailsscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../components/customTextField2.dart';
import '../../consts/style.dart';
import '../Authentication/AuthScreen.dart';
import '../Details/controller.dart';
import '../splash/splash.dart';

class AddressScreen extends StatelessWidget{
  AddressController mapController =AddressController();
  DetailController detailController=DetailController();
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return
    GetBuilder<AddressController>(
        init: AddressController(),
    builder: (mapController) {
    return Scaffold(
    appBar: AppBar(backgroundColor: M.primaryColor,title: Text("EnterYouraddress".tr),centerTitle: true,
   actions: [
   IconButton(onPressed:(){Get.to(AuthScreen());}, icon: Icon(Icons.arrow_forward))
   ],
),
    body:
    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
       child:
       Stack(
           children:[
             GoogleMap(
               markers: mapController.currentPosition !=null?{
                 Marker(markerId: MarkerId('1'),
                     position: LatLng(mapController.currentPosition!.latitude, mapController.currentPosition!.longitude,)),
                 Marker(markerId: MarkerId('2'),
                   position:LatLng(mapController.kLake!.target.latitude,mapController.kLake!.target.longitude),),
                 Marker(markerId: MarkerId('3'),
                   position:LatLng(mapController.kGooglePlex!.target.latitude,mapController.kGooglePlex!.target.longitude),),
               }:{},
             mapType: MapType.normal,
             initialCameraPosition: mapController.kGooglePlex,
             onMapCreated: (gController) {
             mapController.googleMapController = gController;
             mapController.goToCurrentLocation();
            },
           ),
             Column(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Row(mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     SizedBox(width: 290),
                     GestureDetector(
                       onTap: mapController.goToCurrentLocation,
                       child: Container(
                         width: 50,
                         height: 50,
                         decoration: BoxDecoration(
                           color: M.primaryColor,
                           borderRadius: BorderRadius.all(Radius.circular(3)),
                           boxShadow: [
                             BoxShadow(
                               color: M.mainColor.withOpacity(0.5), // Set the shadow color
                               spreadRadius: 2,
                               blurRadius: 7,
                               offset: Offset(0, 2),
                             ),
                           ],
                         ),
                         child: Icon(Icons.location_on_outlined,size: 35,color: M.whiteColor,),
                       ),
                     ),
                     SizedBox(width: 13,)
                   ],
                 ),
                 //  FloatingActionButton.extended(
                 //   onPressed: mapController.goToLake,
                 //   label: const Text('To the lake!'),
                 //   icon: const Icon(Icons.directions_boat),
                 // ),
                 SizedBox(height: 13,),

               ],
             ),

            ],
           ),
          ),
        ),
        ),
          SizedBox(height: 40,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            customTextfield2( width: 170.0, hintText: "AppNo".tr, labelText: "AppNo".tr, controller: detailController.appNo,),
            SizedBox(width: 20,),
            customTextfield2( width: 170.0, hintText: "SpecialMark".tr, labelText: "SpecialMark".tr, controller: detailController.specialMark,),
          ],),
          SizedBox(height: 30,),
          customTextfield2( width: 360.0, hintText: "Notes".tr, labelText: "Notes".tr,height: 100.0, controller: detailController.notes,),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color?>(M.primaryColor),             ),
                    onPressed:(){Get.to(DetailScreen(lat:mapController.currentPosition?.latitude,lng: mapController.currentPosition?.longitude ,appNo: detailController.appNo.text,specialMark: detailController.specialMark.text,notes: detailController.notes.text,));}, child: Text("Confirm".tr)),
              SizedBox(width: 20,),
            ],
          ),
          SizedBox(height: 80,),
         Row( mainAxisAlignment: MainAxisAlignment.end,
         //  crossAxisAlignment: CrossAxisAlignment.end,
           children: [


             SizedBox(width: 20,),
           ],
         ),
        ],),

    ),


    );
    }
  );
  }

}

//  lat:'controller.currentLocation.latitude.toString()',
//   lng:'controller.currentLocation.longitude.toString()',