import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../splash/splash.dart';




Future main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:const FirebaseOptions(
      apiKey:"AIzaSyCpEEI0Kc-AolnXC8gKbQLUB96e3xJX_vc" ,
      appId: "1:371518679307:android:adcfa1011675b37bd0da0e",
      messagingSenderId: "371518679307-d22r4qnsuq090apb7la40vuqthq03o5q.apps.googleusercontent.com",
      projectId: "funfire-6fde8")
  );
  runApp(const MyApp());
}

  class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'FunFire!',
    theme: ThemeData(
    primarySwatch: Colors.blue,),
    home:const Splash(),
    );
    }
}
