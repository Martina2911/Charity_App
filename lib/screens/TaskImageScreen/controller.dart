import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase1/screens/TaskImageScreen/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/itemModel.dart';

class ImageController extends GetxController{
  var loading=false.obs;
  var loading1=false.obs;
  ImageServices services=ImageServices();
  List <ItemModel> list =<ItemModel>[].obs;
  final loading3 = false.obs;
  final image="".obs;
  final ImagePicker imagePicker=ImagePicker();
  ImageServices serv=ImageServices();
  var currentIndex = 0.obs;
  void onChangePage(int index){
    currentIndex.value=index;
  }

  selectImage({source})async{
    try{
      final pickedImage= await imagePicker.pickImage( source: source,imageQuality: 25);//ImageSource.gallery
      if(pickedImage!=null){
        image.value=pickedImage.path;
      }
    }catch(e){
      print(e.toString());
    }
  }

  addToFireStore() async {
    loading.value = true;
    await serv.addToFireStore(
        model: ItemModel(
          imageUrl: await serv.uploadImageToStorage(imagePath: image.value,),
        ));
    loading.value = false;
  }

  addToRealTime() async {
    loading1.value = true;
    await serv.addToRealTime(
        model: ItemModel(
          imageUrl: await serv.uploadImageToStorage(imagePath: image.value),
        ));
    loading1.value = false;
  }

  @override
  onInit(){
    super.onInit();
    //getAllTicket();
    getAllData();
  }

  getAllData()async{
    loading3.value=true;
    try{
      final data=await services.getAllData();
      print(data);
      list.assignAll(data);
      loading3.value=false;

    }catch(e){
      print(e);
    }

  }

  getAllTicket() async {
    loading3.value = true;
    await services.getAllTicketReal((users) {
      list.assignAll(users);
      loading3.value = false;
    });
  }

}