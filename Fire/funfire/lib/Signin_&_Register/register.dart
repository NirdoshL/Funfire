import 'package:flutter/material.dart';
import 'package:funfire/Signin_&_Register/signin.dart';
import 'package:funfire/Signin_&_Register/validate.dart';
import 'package:funfire/authentications/auth.dart';



class Register extends StatefulWidget {
  const Register({ Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
 final Authenticates _auth=Authenticates();
  final _key=GlobalKey<FormState>();
  TextEditingController fnameController=TextEditingController();
  TextEditingController snameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController guildController=TextEditingController();
  TextEditingController newkeyController=TextEditingController();
  TextEditingController conformnewController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Stack(
            children: [
               SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset("images/reg.jpg",fit: BoxFit.fill),
                ),
              Form(
                key: _key,
                child: Column(
                  children: [
                    const Text("Register in FunFire!",style: 
                    TextStyle(
                      color:  Color.fromARGB(255, 220, 223, 86),
                      fontWeight: FontWeight.bold,
                      fontSize: 30),),
                    const SizedBox(height: 30,),
                  TextFormField(
                    validator:(value)=> Validates().validateName(value),
                    controller: fnameController,
                    decoration: inputDecoration("First Name","First Name"),
                    style: const TextStyle(color: Colors.green) ,
                    ),
                   const SizedBox(height: 20,),
                  TextFormField(
                    validator:(value)=> Validates().validateName(value),
                    controller: snameController,
                    decoration: inputDecoration("Second Name","Second Name"),
                    style: const TextStyle(color: Colors.green) ,
   ),
   const SizedBox(height: 20,),
                  TextFormField(
                    validator:(value)=> Validates().validateName(value),
                    controller: guildController,
                    decoration: inputDecoration("Guild Name","Guild Name"),
                    style: const TextStyle(color: Colors.green) ,
   ),
   const SizedBox(height: 20,),
                  TextFormField(
                    validator:(value)=> Validates().validateEmail(value),
                    controller: emailController,
                    decoration: inputDecoration("Email","Email"),
                    style: const TextStyle(color: Colors.green) ,
   ),
   const SizedBox(height: 20,),
                  TextFormField(
                    validator:(value)=> Validates().validateMobile(value),
                    controller: phoneController,
                    decoration: inputDecoration("Phone","Phone"),
                    style: const TextStyle(color: Colors.green) ,
   ),
   const SizedBox(height: 20,),
                  TextFormField(
                    validator:(value)=> Validates().validatePassword(value),
                    controller: newkeyController,
                    decoration: inputDecoration("Password","Password"),
                    style: const TextStyle(color: Colors.green) ,
   ),
   const SizedBox(height: 20,),
                  TextFormField(
                    controller: conformnewController,
                     validator:(value)=> Validates().conformPassword(value,newkeyController.text,conformnewController.text),
                    decoration: inputDecoration("Conform Password","Conform Password"),
                    style: const TextStyle(color: Colors.green) ,
   ),      
   const SizedBox(height: 20,),
    const Text("*Note: By creating an account, You are bound to all the terms and conditions of FunFire! community.",style: 
                    TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  ActionChip(backgroundColor: Colors.green,label: const Text("Register",style: TextStyle(color: Colors.black) ,), onPressed: ()async{
                    if(_key.currentState!.validate()){
          
                     dynamic result=await _auth.createWithEmailandPassword(
                          emailController.text,
                          newkeyController.text,
                          fnameController.text,
                          snameController.text,
                          guildController.text,
                          phoneController.text);
                     if(result==null){
                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(" Failed to create account.")));
                     }
                     else{
                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Welcome to funfire!\nPlease Login to enter.")));
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignIn(),));
                     }
                    }
                  }),
                  const SizedBox(height: 40,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
              labelStyle: const TextStyle(color: Colors.green) ,
              hintStyle: const TextStyle(color: Colors.green),
              );
  }