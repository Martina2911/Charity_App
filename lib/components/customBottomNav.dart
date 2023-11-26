import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../consts/style.dart';
import '../screens/HomePage/homeController/controller.dart';

class CustomBottomNav extends StatelessWidget {
   CustomBottomNav({
    super.key,
     required this.con
  });
 HomeController con=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: M.whiteColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: M.primaryColor,
      selectedLabelStyle: TextStyle(color: M.primaryColor),
      unselectedLabelStyle: TextStyle(color: M.blackColor),
      selectedIconTheme: IconThemeData(color: M.primaryColor),
      unselectedIconTheme: IconThemeData(color: M.blackColor),
      currentIndex: con.selectedIndex.value,
      onTap: (int i) {
        con.changeTap(i);
      },
      items: [
        customBottomNavigationBarItem(
          icon: Icons.call_outlined,
          label: 'Contact'.tr,
          isSelected: con.selectedIndex.value == 0,
        ),
        customBottomNavigationBarItem(
          icon: Icons.home_outlined,
          label: 'Home'.tr,
          isSelected: con.selectedIndex.value == 1,
        ),
        customBottomNavigationBarItem(
          icon: Icons.track_changes,
          label: 'TrackOrder'.tr,
          isSelected: con.selectedIndex.value == 2,
        ),
        customBottomNavigationBarItem(
          icon: Icons.info_outline,
          label: 'OurPlan'.tr,
          isSelected: con.selectedIndex.value == 3,
        ),
      ],
    );
  }
}


BottomNavigationBarItem customBottomNavigationBarItem({
  required IconData icon,
  required String label,
  required bool isSelected,
})
{
  return BottomNavigationBarItem(
      backgroundColor: isSelected ? M.whiteColor: M.primaryColor,
      icon:
      Container(
        width: 100,
        height: 60,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? M.primaryColor : M.whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child:
        Icon(
          icon,
          color: isSelected ? M.whiteColor: M.blackColor,
          weight: 20,
          size: 35,
        ),
      ),
      label: label
  );
}






