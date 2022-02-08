import 'package:flutter/material.dart';
Widget text(String title,double size,Color color){
  return Text(
      title,
    style: TextStyle(fontWeight: FontWeight.w700,
    fontSize: size,
    color: color),
    );
}