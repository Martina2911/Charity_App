import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../consts/style.dart';
import '../../helper/cache_helper.dart';
import '../Authentication/AuthScreen.dart';

class Controller extends GetxController {
  void launcher(String text) async {
    if (await canLaunch(text)) {
      await launch(text);
    } else {
      throw 'Could not launch $text';
    }
  }

  void makePhoneCall(String phoneNumber) async {
    Uri launcherPhone =Uri(
        scheme: 'tel' ,
        path:phoneNumber,
    );
    await launchUrl(launcherPhone);
  }

  void launchEmail(String email) async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunch(_emailLaunchUri.toString())) {
      await launch(_emailLaunchUri.toString());
    } else {
      print('Could not launch $email');
    }
  }

  var selectedLanguage = 'en'.obs;
  void changeLanguage(String language) {
    selectedLanguage.value = language;
    Get.updateLocale(Locale(language));
  }

  void sendFeedback() async {
    final token = await CacheHelper.getData(key: 'token');
    if (token == null) {
      print('No User');
      Get.to(AuthScreen());
    } else {
      print('User token is $token');
      await showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            content:
            Column( mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child:
             Center(child:  Text(
                  "Feedback Sent \n    Thank you",
                  style: TextStyle(color: M.blackColor, fontSize: 20),
                ),
              ),),
            ],
          ),
          );
        },
      );
    }
  }
}
