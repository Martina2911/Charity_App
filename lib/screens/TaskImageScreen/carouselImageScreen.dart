import 'package:firebase1/screens/TaskImageScreen/controller.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import '../../components/animated_indicator.dart';

class ImageSliderScreen extends StatelessWidget {
  ImageController con = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Image from FireStore"),
        backgroundColor: Colors.green,
      ),
      body:
      Column( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Center(
            child: con.loading.value
                ? CircularProgressIndicator()
                : con.list.isNotEmpty
                ? CarouselSlider(
    items: [
      Image.network(con.list[0].imageUrl!),
      Image.network(con.list[0].imageUrl!),
      Image.network(con.list[0].imageUrl!)
    ],
    options: CarouselOptions(
    onPageChanged: (index, r) {
    con.onChangePage(index);
    },
    height: 300,
    aspectRatio: 1.0,
    autoPlay: true,
    enableInfiniteScroll: true,
    viewportFraction: 0.6,
    enlargeCenterPage: true,
    ),
    )
         /*   CarouselSlider.builder(
               itemCount: con.list.length==1?3:1,
               itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  width: 200,
                  height: 300,
                  child: Image.network(con.list[index].imageUrl!),
                );
              },
              options: CarouselOptions(
                onPageChanged: (index, r) {
                  con.onChangePage(index);
                },
                height: 300,
                aspectRatio: 1.0,
                autoPlay: true,
                enableInfiniteScroll: true,
                viewportFraction: 0.6,
                enlargeCenterPage: true,
              ),
            )*/
                : Center(
              child: Text("Empty Data"),
            ),
          )),
          SizedBox(height:20),
          Obx((){return AnimatedIndicator(currentIndex: con.currentIndex.value);}),
        ],
      ),

    );
  }
}