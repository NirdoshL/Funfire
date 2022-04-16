import 'package:flutter/material.dart';
import 'package:progress/styles/titlestl.dart';
class Results extends StatefulWidget {
const Results({ Key? key }) : super(key: key);
@override
State<Results> createState() => _ResultsState();
}
class _ResultsState extends State<Results> {
@override
Widget build(BuildContext context) {
return Center(
child: Text("results",style: textstyle(30,Colors.black,FontWeight.normal),),
);
}
}