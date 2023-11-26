import 'package:firebase1/screens/Authentication/AuthScreen.dart';
import 'package:firebase1/screens/ContactScreen/contactScreen.dart';
import 'package:firebase1/screens/HomePage/HomeScreen.dart';
import 'package:firebase1/screens/OurPlanScreen/screen.dart';
import 'package:firebase1/screens/TrackOrderScreen/screen.dart';
import 'package:get/get.dart';

import '../../../helper/cache_helper.dart';
import '../../AllDetails/AllDetailsScreen.dart';
import '../../Details/Detailsscreen.dart';
import '../../TrackOrderScreen/controller.dart';

class HomeController extends GetxController{
  AllDetailController con =Get.put(AllDetailController());
  var currentIndex=0.obs;
  var selectedIndex=1.obs;

  void onChangePage(int index){
    currentIndex.value=index;
  }

  void changeTap(int index){
    selectedIndex.value=index;
    if(index==2){
      con.getAllData();
      Get.to(TrackScreen());
    }
   if(index==3){
     Get.to(OurPlan());
   }
    if(index==1){
      Get.to(HomeScreen());
    }
    if(index==0){
      Get.to(Contact());
    }
  }

  DonateAuth()async{
    final token =await CacheHelper.getData(key: 'token');
    if(token==null){
      print('No User');
      Get.to(AuthScreen());
    }else{
      print(' User token is ${token}::');
      Get.to(DetailScreen());
    }
  }

}