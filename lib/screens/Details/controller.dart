
import 'dart:io';

import 'package:firebase1/screens/Details/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../consts/style.dart';
import '../../model/itemModel.dart';
import 'package:firebase1/screens/TrackOrderScreen/controller.dart';

class DetailController extends GetxController{
  Position? currentPosition;
  int i=0;
  TextEditingController numOfPieces = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController notes =TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController appNo = TextEditingController();
  TextEditingController specialMark = TextEditingController();
  var index=0;
  var index1=0;
  
  final loading = false.obs;
  final loading1 = false.obs;
  final loading2 = false.obs;

  DetailServices serv=DetailServices();
  AllDetailController con=AllDetailController();

  final image="".obs;
  final ImagePicker imagePicker=ImagePicker();

  final _storage = FirebaseStorage.instance;
  var selectedTimeString;


  selectImage({source})async{
  try{
  final pickedImage= await imagePicker.pickImage( source: source,imageQuality: 25);//ImageSource.gallery
  if(pickedImage!=null){
   image.value=pickedImage.path;//path
    }
  }catch(e){
    print(e.toString());
    }
  }


  DateTime? selectedDate;
  TimeOfDay ? selectedTime;

  selectDateFunc(context)async{
    var picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2030),
        builder: ( BuildContext context ,Widget ?child){
          return Theme(data: ThemeData.light().copyWith(
            colorScheme:ColorScheme.light().copyWith(
                primary: M.primaryColor
            ),
          ),
              child: child!);
        }
    ) ;

    print(picked);
    if(picked  !=null){
        selectedDate=picked;//'yyyy-MM-dd'
   update();
    }
  }

  selectTimeFunc(context)async{
    var picked1= await showTimePicker(context: context, initialTime: TimeOfDay.now(),
        builder: ( BuildContext context ,Widget ?child){
          return Theme(data: ThemeData.light().copyWith(
            colorScheme:ColorScheme.light().copyWith(
                primary: M.primaryColor
            ),
          ),
              child: child!);
        }
    );
    print(picked1);
    if(picked1 !=null){
        selectedTime =picked1;
        update();
       selectedTimeString = selectedTime!.format(context); // Convert TimeOfDay to String
    }

  }

  Future<void> deleteData({required index}) async {
    loading2.value = true;
    await serv.deleteData(index: index--);
    loading2.value = false;
    index=index--;
    con.getAllData();
  }


  addToFireStore({appNo,notes,specialMark,lat,lng}) async {
     loading.value = true;
      await serv.addToFireStore(
        model: ItemModel(
            pieces: numOfPieces.text!=null?numOfPieces.text:"",
            address: address.text!=null?address.text:"",
            time:selectedTimeString!=null?selectedTimeString:"" ,
            date: selectedDate.toString()!=null?selectedDate.toString():"",
            lng: lng!=null?lng:00000,//currentPosition!.longitude,
            imageUrl: await serv.uploadImageToStorage(imagePath: image.value, imageName: "${selectedTimeString}"),
            lat:lat!=null?lat:00000,//currentPosition!.latitude ,
            specialMark: specialMark!=null?specialMark:"",
            apartmentNumber: appNo!=null?appNo:"",
            status: notes!=null?notes:""
        ), index: index,
      );
      loading.value = false;
     index++;
     con.getAllData();
  }


  // addToFireStore() async {
  //   if (currentPosition == null) {
  //     print("User's location is not available.");
  //   }
  //   loading.value = true;
  //   await serv.addToFireStore(
  //       model: ItemModel(
  //         pieces: numOfPieces.text,
  //         address: address.text,
  //         time:selectedTimeString ,
  //         date: selectedDate.toString(),
  //         lng: 0.0,//currentPosition!.longitude ,
  //          imageUrl: await serv.uploadImageToStorage(imagePath: image.value, imageName: "imageName"),
  //          lat:0.0,//currentPosition!.latitude ,
  //          specialMark: specialMark.text,
  //          apartmentNumber: appNo.text,
  //       ));
  //   loading.value = false;
  // }

  addToRealTime({appNo,notes,specialMark,lat,lng}) async {
    loading1.value = true;
    try{
    await serv.uploadImageToStorage(imagePath:image.value, imageName: "Test");
    await serv.addToRealTime(
        model: ItemModel(
            pieces: numOfPieces.text!=null?numOfPieces.text:"",
            address: address.text!=null?address.text:"",
            time:selectedTimeString!=null?selectedTimeString:"" ,
            date: selectedDate.toString()!=null?selectedDate.toString():"",
            lng: lng!=null?lng:00000,//currentPosition!.longitude,
            imageUrl: await serv.uploadImageToStorage(imagePath: image.value, imageName: "imageName"),
            lat:lat!=null?lat:00000,//currentPosition!.latitude ,
            specialMark: specialMark!=null?specialMark:"",
            apartmentNumber: appNo!=null?appNo:"",
            status: notes!=null?notes:""
        ), index: index1);
    loading1.value = false;
    index1++;

    }catch(e){
      print(e);
    }
  }

}