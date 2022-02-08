import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'text.dart';
import 'package:get/get.dart';
import 'home.dart';

Widget intro(Color color){
  return IntroductionScreen(
  showSkipButton: true,
  next: text("Next",10, Colors.black87),
  skip: text("Skip",10, Colors.black87),
  done:text('done',10,Colors.black87) ,
  onSkip: (){
        Get.off(const Home());
  },
  onDone: (){
        Get.off(const Home());
  },
  pages: [
  pagemodel("Asmin Memorial School", "Come as Student,leave as a leader", "images/school.jpg", Colors.black),
  pagemodel("Result Published!!", "8th Class result published. See on your result section", "images/school.jpg", Colors.black),
  pagemodel("School Farewell Program", "Dancing! Singing! and many more.", "images/school.jpg", Colors.black),
  ],
  );
}
PageViewModel pagemodel(String title,String body,String image,Color color)
{
  return PageViewModel(
  title: title,
  body: body,
  image: Center(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(borderRadius: BorderRadius.circular(30),
    child:SizedBox(
      child: Image.asset(image, fit: BoxFit.fill,)),
  ))),
  decoration: PageDecoration(
  pageColor: color,
  titleTextStyle:textstyle(20),
  bodyTextStyle: textstyle(14)
  ),
  );
}
TextStyle textstyle(double size){
    return TextStyle(color: Colors.white,fontSize: size, fontWeight: FontWeight.bold);
}