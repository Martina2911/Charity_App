import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../consts/style.dart';
import '../screens/TaskImageScreen/controller.dart';

class AnimatedIndicator extends StatelessWidget {
   AnimatedIndicator({
    super.key,
    required this.currentIndex,
  });
   final int currentIndex;
final controller=Get.put(ImageController());
  @override
  Widget build(BuildContext context) {
    return
      AnimatedSmoothIndicator(
        activeIndex: currentIndex,
        count: 3,
        effect: ExpandingDotsEffect(
            dotHeight: 5,
            dotWidth: 5,
            activeDotColor: M.primaryColor,
            dotColor: M.primaryColor),
      );
     /* AnimatedSmoothIndicator(
      activeIndex: currentIndex,
      count: 3,
      effect: ExpandingDotsEffect(
        dotColor: Colors.black,
        expansionFactor: 2,
        dotHeight: 7,
        dotWidth: 7,
        activeDotColor:M.primaryColor,
      ),
    );*/
  }
}