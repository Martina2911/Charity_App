import 'package:firebase1/screens/Authentication/controller.dart';
import 'package:firebase1/screens/HomePage/homeController/controller.dart';
import 'package:firebase1/screens/TrackOrderScreen/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:firebase1/screens/Details/Detailsscreen.dart';
import '../../components/customBottomNav.dart';
import '../../consts/style.dart';
import '../../helper/cache_helper.dart';
import '../Authentication/AuthScreen.dart';
import '../StatusScreen/StatusScreen.dart';


class TrackScreen extends StatelessWidget{
  final token = CacheHelper.getData(key: 'token');
  AuthController auth=Get.put(AuthController());
  final con =Get.put(HomeController());
  AllDetailController conn=Get.put(AllDetailController());
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(backgroundColor: M.primaryColor,
       title: Text("TrackOrder".tr,style: TextStyle(fontSize: 25,color: M.whiteColor,fontWeight: FontWeight.bold),),
       centerTitle: true,),
     body:
     SafeArea(
       child:
       Obx(() {
         return Center(
            child:
            conn.loading.value
               ? Center(child: Image.asset("assets/images/empty.png"))
            //CircularProgressIndicator()
               : conn.list.isNotEmpty
               ? ListView.builder(
             itemCount: conn.list.length,
             shrinkWrap: true,
             itemBuilder: (context, index) {
               return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: GestureDetector(
                   onTap: () {
                     Get.to(StatusScreen(
                       name: auth.emailController.text,
                       index: index,
                       address: conn.list[index].address,
                       piece: conn.list[index].pieces,
                       appartno: conn.list[index].apartmentNumber,
                       special: conn.list[index].specialMark,
                       date: conn.list[index].date,
                       time: conn.list[index].time,
                       imgurl: conn.list[index].imageUrl,
                       status: conn.list[index].status,
                     ));
                   },
                   child: Container(
                     width: 300,
                     height: 200,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(12),
                       border: Border.all(color: M.primaryColor, width: 3.0),
                       boxShadow: [
                         BoxShadow(
                           color: M.primaryColor.withOpacity(0.5),
                           spreadRadius: 2,
                           blurRadius: 5,
                           offset: Offset(0, 3),
                         )
                       ],
                     ),
                     child: Row(
                       children: [
                         SizedBox(width: 10,),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Container(
                               width: 120,
                               height: 160,
                               decoration: BoxDecoration(
                                 color: M.whiteColor,
                                 borderRadius: BorderRadius.circular(12),
                                 border: Border.all(color: M.primaryColor, width: 3.0),
                               ),
                               child: Center(
                                 child: Image.network(conn.list[index].imageUrl!, fit: BoxFit.cover),
                               ),
                             ),
                             SizedBox(width: 15),
                           ],
                         ),
                         SizedBox(width: 15),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             SizedBox(height: 18,),
                             Row(
                               children: [
                                 Icon(Icons.calendar_month_outlined, color: Colors.grey, size: 20,),
                                 Text(
                                   " ${conn.list[index].date!.contains("00") ? conn.list[index].date?.substring(0, conn.list[index].date?.indexOf('00')) : conn.list[index].date}",
                                   style: TextStyle(color: Colors.black),
                                 ),
                                 SizedBox(width: 15),
                                 Icon(Icons.alarm, color: Colors.grey, size: 20,),
                                 Text(
                                   " ${conn.list[index].time}",
                                   style: TextStyle(color: Colors.black,),
                                 ),
                                 SizedBox(width: 10),
                               ],
                             ),
                             SizedBox(height: 10),
                             Text("NoOfPieces: ${conn.list[index].pieces}"),
                             SizedBox(height: 10),
                             Text("Address: ${conn.list[index].address}"),
                             SizedBox(height: 10),
                             Text("Appartement Number: ${conn.list[index].apartmentNumber}"),
                             SizedBox(height: 10),
                             Text("Special Mark: ${conn.list[index].specialMark}"),
                             SizedBox(height: 10),
                             Text("Any Notes : ${conn.list[index].status}"),
                           ],
                         ),
                       ],
                     ),
                   ),
                 ),
               );
             },
           )
               : Center(child: Image.asset("assets/images/empty.png")),
         );
       }),
     ),
       floatingActionButton:Container(
         width: 74,
         height: 74,
         decoration: BoxDecoration(
           shape: BoxShape.circle,
           color: M.primaryColor,
         ),
         child:FloatingActionButton(
           onPressed: () async {
         final token =await CacheHelper.getData(key: 'token');
          if(token==null){
          print('No User');
           Get.to(AuthScreen());
            }else{
              print(' User token is ${token}::');
             Get.to(DetailScreen());
    }
           },
           child: Icon(Icons.add,size: 50,weight:9.0,color: Colors.white,),
           backgroundColor: M.primaryColor,
         ),),
       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
       bottomNavigationBar:
       GetBuilder<HomeController>(
         builder: (controller) {
           return CustomBottomNav(con: controller);
         },
       )
   );
  }
  // AllDetailController con=Get.put(AllDetailController());
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar:AppBar(backgroundColor: M.primaryColor,title: Text("Track your Order"),centerTitle: true,),
  //     body: SafeArea(
  //       child:
  //       Obx(() {
  //         return Center(
  //           child: con.loading.value
  //               ? CircularProgressIndicator()
  //               : con.list.isNotEmpty?
  //           ListView.builder(
  //             itemCount: con.list.length,
  //             shrinkWrap: true,
  //             itemBuilder: (context, index) {
  //               return
  //                 Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: Container(
  //                       width: 300,
  //                       height: 200,
  //                       decoration: BoxDecoration(
  //                           color: Colors.white,
  //                           borderRadius: BorderRadius.circular(12),
  //                           border: Border.all(color: M.primaryColor, width: 3.0),
  //                           boxShadow: [
  //                             BoxShadow(
  //                               color: M.primaryColor.withOpacity(0.5),
  //                               spreadRadius: 2,
  //                               blurRadius: 5,
  //                               offset: Offset(0, 3),
  //
  //                             )]
  //                       ),
  //                       child:
  //                       Row(
  //                         children:
  //                         [
  //                           SizedBox(width: 10,),
  //                           Column(
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             crossAxisAlignment: CrossAxisAlignment.center,
  //                             children: [
  //                               Container(
  //                                 width: 120,
  //                                 height: 160,
  //                                 decoration: BoxDecoration(
  //                                   color: M.whiteColor,
  //                                   borderRadius: BorderRadius.circular(12),
  //                                   border: Border.all(color: M.primaryColor, width: 3.0),
  //                                 ),
  //                                 child: Center(
  //                                   child: Image.network(con.list[index].imageUrl!, fit: BoxFit.cover),
  //                                 ),
  //                               ),
  //                               SizedBox(width: 15),
  //                             ],
  //                           ),
  //                           SizedBox(width: 15),
  //                           Column(
  //                             mainAxisAlignment: MainAxisAlignment.start,
  //                             crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
  //                             children: [
  //                               SizedBox(height: 18,),
  //                               Row(
  //                                 children: [
  //                                   Icon(Icons.calendar_month_outlined, color: Colors.grey ,size: 20,),
  //                                   Text(" ${con.list[index].date!.contains("00") ? con.list[index].date?.substring(0, con.list[index].date?.indexOf('00')) : con.list[index].date}",
  //                                     style: TextStyle(color: Colors.black),
  //                                   ),
  //                                   SizedBox(width: 15),
  //                                   Icon(Icons.alarm, color: Colors.grey,size: 20,),
  //                                   Text(" ${con.list[index].time}",
  //                                     style: TextStyle(color: Colors.black,
  //                                     ),
  //                                   ),
  //                                   SizedBox(width: 10),
  //                                 ],
  //                               ),
  //                               SizedBox(height: 10),
  //                               Text("No of Pieces: ${con.list[index].pieces}"),
  //                               SizedBox(height: 10),
  //                               Text("Address: ${con.list[index].address}"),
  //                               SizedBox(height: 10),
  //                               Text("Appartement Number: ${con.list[index].apartmentNumber}"),
  //                               SizedBox(height: 10),
  //                               Text("Special Mark: ${con.list[index].specialMark}"),
  //                               SizedBox(height: 10),
  //                               Text("Any Notes : ${con.list[index].status}"),
  //                             ],
  //                           ),
  //                         ],
  //                       )
  //
  //                   ),
  //                 );
  //             },
  //           ):
  //           Center(child:Image.asset("assets/images/empty.png"),
  //           ),
  //         );
  //       }),
  //     ),
  //     floatingActionButton:Container(
  //       width: 74,
  //       height: 74,
  //       decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         color: M.primaryColor,
  //       ),
  //       child:FloatingActionButton(
  //         onPressed: () {
  //           Get.to(DetailScreen());
  //         },
  //         child: Icon(Icons.add,size: 50,weight:9.0,color: Colors.white,),
  //         backgroundColor: M.primaryColor,
  //       ),),
  //     floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
  //   );
  // }

}


