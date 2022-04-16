import 'package:flutter/material.dart';
import 'package:progress/screens/home/home.dart';
import 'package:progress/screens/login/login.dart';
import 'package:progress/screens/register/register.dart';

void main() {
runApp(const MyApp());
}
class MyApp extends StatelessWidget {
const MyApp({Key? key}) : super(key: key);
// This widget is the root of your application.
@override
Widget build(BuildContext context) {
return MaterialApp(
      title: 'FunFire!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primarySwatch: Colors.blue,),
      home: const Home());
  }
}

