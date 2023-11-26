import 'dart:async';

import 'package:firebase1/screens/Authentication/AuthScreen.dart';
import 'package:firebase1/screens/Details/Detailsscreen.dart';
import 'package:firebase1/screens/Details/services.dart';
import 'package:firebase1/screens/HomePage/HomeScreen.dart';
import 'package:get/get.dart';

import '../../helper/cache_helper.dart';

class Splash extends GetxController{
  @override
  /*void onInit() {
    Timer(const Duration(seconds: 5), ()
    {
      Get.offAll(AuthScreen());
    });
    super.onInit();
  }*/
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 5),()async{

        Get.to(HomeScreen());

    });
  }
}