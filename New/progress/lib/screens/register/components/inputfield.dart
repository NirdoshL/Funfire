import 'package:flutter/material.dart';
import 'package:progress/colors/colors.dart';

TextField textfield(IconData icon,bool obs,String hinttext){return TextField(
                obscureText: obs,
                    showCursor: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        icon,
                        color: Clr.black,
                        size: 20,
                      ),
                      fillColor: Clr.littlewhite,
                      hintStyle: TextStyle(
                          color: Clr.littleblack,
                          fontSize: 20),
                      hintText: hinttext,
                    ),
                  );}