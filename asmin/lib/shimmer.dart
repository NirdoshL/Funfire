
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

Widget shimmer(){
  return Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: const Color.fromARGB(179, 207, 202, 202),
        loop: 3,
       child:const SizedBox(height: 20,width: 20,
       child:Image(image:AssetImage('images/burg.jpg'),
        fit: BoxFit.fill,
       ),),
  );
}