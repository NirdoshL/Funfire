import 'package:flutter/material.dart';
import 'package:funfire/Signin_&_Register/register.dart';
import 'package:funfire/Signin_&_Register/validate.dart';
import 'package:funfire/authentications/auth.dart';
import 'package:funfire/silvers/home.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SignIn extends StatefulWidget {
  const SignIn({ Key? key}) : super(key: key);
  @override
  State<SignIn> createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
 final Authenticates _auth=Authenticates();
  final _key=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController newkeyController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
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
                  const Text("Login to FunFire!",style: 
                  TextStyle(color:Color.fromARGB(255, 220, 223, 86),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),),
                  const SizedBox(height: 30,),
   const SizedBox(height: 20,),
                TextFormField(
                  validator:(value)=> Validates().validateEmail(value),
                  controller: emailController,
                  decoration: inputDecoration("Email","Email"),
                  style: const TextStyle(color: Colors.green) ,
   ),
   const SizedBox(height: 20,),
                TextFormField(
                  controller: newkeyController,
                   validator:(value)=> Validates().validatePassword(value),
                  decoration: inputDecoration("Password","Password"),
                  style: const TextStyle(color: Colors.green) ,
   ),      
   const SizedBox(height: 20,),
                ActionChip(backgroundColor: Colors.green,label: const Text("LogIn",style: TextStyle(color: Colors.black) ,), onPressed: ()async{
                  try{
                  if(_key.currentState!.validate()){
                   dynamic result=await _auth.signWithEmailandPassword(emailController.text, newkeyController.text);
                   if(result==null){
                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Failed to login.")));
                   }
                   else{
                    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
                    sharedPreferences.setString('email', emailController.text);
                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Welcome to funfire!")));
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home(),));
                   }}}catch(e){
                     ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("$e")));
                   }
                  
                }),
                const SizedBox(height: 20,),
                 TextButton(
                   onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const Register(),));
                   },
                   child: const Text("Not regestered yet, click here",style: 
                    TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                 ),
                const SizedBox(height: 40,),
                ],
              ),
            ),
          ],
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