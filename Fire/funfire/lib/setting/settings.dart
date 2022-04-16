import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:funfire/authentications/database.dart';

import '../Signin_&_Register/validate.dart';

class Settings extends StatefulWidget {
  const Settings({ Key? key ,required this.image,required this.guild,required this.email,required this.sname,required this.fname}) : super(key: key);
  final String fname;
  final String sname;
  final String email;
  final String guild;
  final String image;
  @override
  State<Settings> createState() => _SettingsState();
}
class _SettingsState extends State<Settings> {
  User? currentuser=FirebaseAuth.instance.currentUser;
  TextEditingController fnameController=TextEditingController();
  TextEditingController snameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController oldkeyController=TextEditingController();
  TextEditingController newkeyController=TextEditingController();
  TextEditingController conformnewController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Change Your basic details:",style: 
              TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              TextFormField(
              controller: fnameController,
               validator:(value)=> Validates().validateName(value),
              decoration: inputDecoration(widget.fname,widget.fname),
              style: const TextStyle(color: Colors.green) ,
   ),   
              const SizedBox(height: 20,),
               TextFormField(
              controller: snameController,
               validator:(value)=> Validates().validateName(value),
              decoration: inputDecoration(widget.sname,widget.sname),
              style: const TextStyle(color: Colors.green) ,
   ),   
              const SizedBox(height: 20,),
              TextFormField(
              controller: phoneController,
               validator:(value)=> Validates().validateMobile(value),
              decoration: inputDecoration(widget.email,widget.email),
              style: const TextStyle(color: Colors.green) ,
   ),   
              const SizedBox(height: 20,),
              Center(child: TextButton(
              child:const Text("Click to conform changes.",
              style: TextStyle(color: Colors.green,
              fontWeight: FontWeight.bold),),
              onPressed: (){
              Databases data=Databases(uid: currentuser!.uid);
              data.update(
                widget.email, fnameController.text, 
                snameController.text,widget.guild,phoneController.text,widget.image);
              }, ),),
              const SizedBox(height: 20,),
              const LinearProgressIndicator(value: 1,color: Colors.red,),
              const SizedBox(height: 20,),
              const Text("Change Your  password:",style: 
              TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
               TextFormField(
              controller: oldkeyController,
               validator:(value)=> Validates().validatePassword(value),
              decoration: inputDecoration("Old Password","Old Password"),
              style: const TextStyle(color: Colors.green) ,
   ),   
              const SizedBox(height: 20,),
               TextFormField(
              controller: newkeyController,
               validator:(value)=> Validates().validatePassword(value),
              decoration: inputDecoration("New Password","New Password"),
              style: const TextStyle(color: Colors.green) ,
   ),   
              const SizedBox(height: 20,),
            TextFormField(
              controller: conformnewController,
               validator:(value)=> Validates().validatePassword(value),
              decoration: inputDecoration("Conform Password","Conform Password"),
              style: const TextStyle(color: Colors.green) ,
   ),   
              const SizedBox(height: 20,),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              TextButton(
              child:const Text("Click to conform changes.",
              style: TextStyle(color: Colors.green,
              fontWeight: FontWeight.bold),),
              onPressed: (){}, ),
              TextButton(
              child:const Text("Forgot Password,recover.",
              style: TextStyle(color: Colors.red,
              fontWeight: FontWeight.bold),),
              onPressed: (){}, ),
              const SizedBox(height: 20,),
              ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 TextFormField textFormField(String hint,String label,TextEditingController controller){
   return TextFormField(
              controller: controller,
              decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
              color: Colors.green,
              ),
              ),
              enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
              color: Colors.green,
              ),
              ),
              hintText: hint,
              labelText: label,
              labelStyle: const TextStyle(color: Colors.red) ,
              hintStyle: const TextStyle(color: Colors.red),
              ),
              style: const TextStyle(color: Colors.green) ,
   );
 }
 InputDecoration inputDecoration(String label,String hint){
    return InputDecoration(
              focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
              color: Colors.green,
              ),
              ),
              enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
              color: Colors.green,
              ),
              ),
              hintText: hint,
              labelText: label,
              labelStyle: const TextStyle(color: Colors.blueAccent) ,
              hintStyle: const TextStyle(color: Colors.blueAccent),
              );
  }