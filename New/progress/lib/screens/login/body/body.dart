import 'package:flutter/material.dart';
import 'package:progress/colors/colors.dart';
import 'package:progress/images/images.dart';
import 'package:progress/screens/home/home.dart';
import 'package:progress/screens/register/components/inputfield.dart';
import 'package:progress/screens/register/register.dart';
import 'package:progress/styles/titlestl.dart';

class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
   return SizedBox(
     width: double.infinity,
     child: Stack(
       children: [
         Image.asset(UsedImage.back),
         Center(
           child: Column(
             children: [
               Text('FunFire!',style: textstyle(50,Clr.red,FontWeight.w500)),
               const Spacer(),
               Text("Login Form",style: textstyle(20,Clr.red,FontWeight.w500),),
               const SizedBox(height: 20,),
               textfield(Icons.person,false,"User Name/email"),
               const SizedBox(height: 10,),
               textfield(Icons.password,true,"Password"),
               const SizedBox(height: 10,),
               TextButton(onPressed: (){
               Navigator.push(context,MaterialPageRoute(builder: (context){
               return const Register();
               }));
               },child:Text("Not registered yet,click here",
               style: textstyle(10,Clr.red,FontWeight.w500),)),
               const Spacer(),
               Text("*. If your click on Login, you'll be accepting all the terms and conditions of FunFire! community automatically."
               ,style: textstyle(10,Clr.blue,FontWeight.w500),),
               const SizedBox(height: 10,),
               ElevatedButton(onPressed: (){
               Navigator.push(context,MaterialPageRoute(builder: (context){
               return const Home();
               }));
               },
               style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
              return Clr.green;
              }
              return Colors.red;
              }),),
               child: Text("Login",style: textstyle(15,Clr.littleblack,FontWeight.w500),))
             ],
           ),
         )
       ],
     ),
   );
  }
}