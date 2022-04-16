import 'package:flutter/material.dart';
import 'package:progress/colors/colors.dart';
import 'package:progress/images/images.dart';
import 'package:progress/screens/register/components/inputfield.dart';
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
               Spacer(),
               Text("Registration Form",style: textstyle(20,Clr.red,FontWeight.w500),),
               Spacer(),
               textfield(Icons.person,false,"First Name"),
               Spacer(),
               textfield(Icons.person,false,"Second Name"),
               Spacer(),
               textfield(Icons.email,false, "Email"),
               Spacer(),
               textfield(Icons.phone,false,"Phone"),
               Spacer(),
               textfield(Icons.password,true,"Password"),
               Spacer(),
               textfield(Icons.password,true,"Conform Password"),
               Spacer(),
               Text("*. If your click on register, you'll be accepting all the terms and conditions of FunFire! community automatically."
               ,style: textstyle(10,Clr.blue,FontWeight.w500),),
               ElevatedButton(onPressed: (){},
               style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
              return Clr.green;
              }
              return Colors.red;
              }),),
               child: Text("Register",style: textstyle(15,Clr.littleblack,FontWeight.w500),))
             ],
           ),
         )
       ],
     ),
   );
  }
}