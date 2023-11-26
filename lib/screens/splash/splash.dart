import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/style.dart';
import 'controller.dart';

class SplashScreen extends StatelessWidget{
  final controller = Get.put(Splash());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: M.primaryColor,
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SizedBox(
              //height: 300,
              child:
              Image.asset('assets/images/logo11.png',)
          ),
            SizedBox(height: 50),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 100,
              child: const RotatedBox(
                quarterTurns: 2,
                child: LinearProgressIndicator(
                  minHeight: 2,
                  color: Colors.white,
                //  backgroundColor: k.mainColor.withOpacity(0.5),
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}