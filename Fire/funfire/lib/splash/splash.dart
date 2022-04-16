import 'dart:async';
import 'package:flutter/material.dart';
import 'package:funfire/silvers/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:funfire/Signin_&_Register/signin.dart';



class Splash extends StatefulWidget {
  const Splash({ Key? key }) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
  }
class _SplashState extends State<Splash> {
  late String? obtainedemail;
  @override
  void initState() {
    getValidationData().whenComplete(()async{
    Timer(const Duration(seconds: 6), (() =>{
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => (obtainedemail==null)?const SignIn():const Home(),))}));
    });
  super.initState();
  }
  //use of shared_preferences
  Future getValidationData()async{
   final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   String? email=sharedPreferences.getString('email');
   setState(() {
       obtainedemail=email;
   });
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  backgroundColor: Colors.black,
  body: Center(
    child: SizedBox(
    height: 300,
    width:500,
    child: Image.asset("images/Ybg.gif",fit: BoxFit.fill,),),
  ),
  );
  }
}
