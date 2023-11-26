import 'package:firebase1/screens/Details/services.dart';
import 'package:firebase1/screens/TrackOrderScreen/controller.dart';
import 'package:firebase1/screens/Details/Detailsscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../consts/style.dart';
import '../../helper/cache_helper.dart';
import '../Authentication/controller.dart';
import '../StatusScreen/StatusScreen.dart';

class GetAllDetailScreen extends StatelessWidget{

  DetailServices ds=DetailServices();
  AuthController auth =Get.put(AuthController());
  AllDetailController con=Get.put(AllDetailController());
  @override
  Widget build(BuildContext context) {
    final token = CacheHelper.getData(key: 'token');
    return Scaffold(
    appBar:AppBar(backgroundColor: M.primaryColor,title: Text("Details"),centerTitle: true,),
    body: SafeArea(
     child:
     Obx(() {
        return Center(
          child: con.loading.value
              ? CircularProgressIndicator()
              : con.list.isNotEmpty?
          ListView.builder(
            itemCount: con.list.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  GestureDetector(
                    onTap:(){ Get.to(StatusScreen(
                      name:  auth.emailController.text ,
                      index: index,
                      address: con.list[index].address,
                      piece: con.list[index].pieces, appartno: con.list[index].apartmentNumber,
                      special: con.list[index].specialMark,
                      date: con.list[index].date,
                      time: con.list[index].time,
                      imgurl:con.list[index].imageUrl,
                      status: "Accepted",
                    ));},
                    child:
                  Container(
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

                          )]
                    ),
                    child:
                    Row(
                      children:
                      [
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
                                child: Image.network(con.list[index].imageUrl!, fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(width: 15),
                          ],
                        ),
                        SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                          children: [
                            SizedBox(height: 18,),
                            Row(
                              children: [
                               Icon(Icons.calendar_month_outlined, color: Colors.grey ,size: 20,),
                                Text(" ${con.list[index].date!.contains("00") ? con.list[index].date?.substring(0, con.list[index].date?.indexOf('00')) : con.list[index].date}",
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(width: 15),
                                Icon(Icons.alarm, color: Colors.grey,size: 20,),
                                Text(" ${con.list[index].time}",
                                  style: TextStyle(color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text("No of Pieces: ${con.list[index].pieces}"),
                            SizedBox(height: 10),
                            Text("Address: ${con.list[index].address}"),
                            SizedBox(height: 10),
                            Text("Appartement Number: ${con.list[index].apartmentNumber}"),
                            SizedBox(height: 10),
                            Text("Special Mark: ${con.list[index].specialMark}"),
                            SizedBox(height: 10),
                            Text("Any Notes : ${con.list[index].status}"),
                          ],
                        ),
                      ],
                    )

                  ),),
                );
            },
          ):Center(child:Image.asset("assets/images/empty.png"),
          ),
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
        onPressed: () {
          Get.to(DetailScreen());
        },
        child: Icon(Icons.add,size: 50,weight:9.0,color: Colors.white,),
        backgroundColor: M.primaryColor,
      ),),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
  );
  }

}
