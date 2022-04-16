import 'package:flutter/material.dart';
import 'package:progress/screens/login/body/body.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Body(),
    );
  }
}