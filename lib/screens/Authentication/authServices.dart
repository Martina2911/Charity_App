import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/style.dart';
import '../../helper/cache_helper.dart';
import 'AuthScreen.dart';

class AuthServices{
  final auth=FirebaseAuth.instance;

  signIn({email,pass})async{
    final user =await auth.signInWithEmailAndPassword(email: email, password: pass);
   print('TODO::: ${user.user?.uid??''}');
   await  CacheHelper.saveData(key: 'token', value: user.user?.uid);
  }

  signUp({email,pass})async{
    UserCredential user =  await auth.createUserWithEmailAndPassword(email: email, password: pass);
     print(user.user?.uid);
     print('TODO::: ${user.user?.uid??''}');
    await  CacheHelper.saveData(key: 'token', value: user.user?.uid);
  }

  signOut()async{
  await auth.signOut();
  await CacheHelper.clearData();
  }

  delete() async {
    final token = await CacheHelper.getData(key: 'token');
    if (token == null) {
      print('No User');
      showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            title: Text(""),
            content:
            Column( mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    "No Account Found",
                    style: TextStyle(color: M.blackColor, fontSize: 20),
                  ),
                ),
                SizedBox(height: 35,),
              ],
            ),
          );
        },
      );
    } else {
      print('User token is $token');

      await auth.currentUser?.delete();
      await CacheHelper.clearData();
      Get.to(AuthScreen());

    }
  }


}