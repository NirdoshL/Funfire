import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funfire/Signin_&_Register/signin.dart';
import 'package:funfire/UsersModel/user.dart';
import 'package:funfire/authentications/database.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Authenticates{
  final FirebaseAuth _auth=  FirebaseAuth.instance;

// create user object based on firebase User
Users? _userFromFirebase(User? users){
    return users!= null ?Users(uid: users.uid,email: users.email)
    :null;
}

  //register in with  email and password.
     Future createWithEmailandPassword(
       String email,
       String password,
       String firstName,
       String secondName,
       String guildName,
       String phone)async{
        try{     
            String image="https://firebasestorage.googleapis.com/v0/b/funfire-6fde8.appspot.com/o/bydefaultimage%2Fnouser.png?alt=media&token=26fbb95b-4d0c-4936-9e77-e0442ebc68e9";
            UserCredential  result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
            User? users= result.user;
  //creates a new documents for user with uid or simply used to update user
            await Databases(uid: users!.uid).update(email, firstName,secondName, guildName,phone,image); 
  //return will return a User instance cause this future function
  //is stored in dynamic variable in register class.
            return _userFromFirebase(users);
        }catch(error){
          return error;
        }
      }
  //sign in with  email and password.
     Future signWithEmailandPassword(String email,String password)async{
        try{
            UserCredential  result=await _auth.signInWithEmailAndPassword(email: email, password: password);
            User? users= result.user;
            return _userFromFirebase(users);
        }catch(error){
          return null;
        }
      }
  
  //Sign out 
    Future signOut(context)async{
      final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      sharedPreferences.remove('email');
      Navigator.of(context).pushReplacement( MaterialPageRoute(builder: ((context) => const SignIn())));
        await _auth.signOut();
     }
  // //Verify the phone number
}