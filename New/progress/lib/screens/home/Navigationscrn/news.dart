import 'package:flutter/material.dart';
import 'package:progress/styles/titlestl.dart';
class News extends StatefulWidget {
const News({ Key? key }) : super(key: key);
@override
State<News> createState() => _NewsState();
}
class _NewsState extends State<News> {
@override
Widget build(BuildContext context) {
return Center(
child: Text("news",style: textstyle(30,Colors.black,FontWeight.normal),),  
);
}
}