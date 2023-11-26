import 'package:flutter/cupertino.dart';

import '../consts/style.dart';

class CarouselCont extends StatelessWidget{
  final img;
  const CarouselCont( {super.key, this.img});
  @override
  Widget build(BuildContext context) {
   return Center(child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
    height: 350,
    width: MediaQuery.of(context).size.width - 30,
    decoration: BoxDecoration(
    border:Border.all(
    color: M.primaryColor,
    width: 5
     ),
    ),
     child: Image.network(img,fit: BoxFit.cover,),
     )
    )
   );
  }

}