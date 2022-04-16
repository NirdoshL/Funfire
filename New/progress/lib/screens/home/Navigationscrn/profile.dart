import 'package:flutter/material.dart';
import 'package:progress/styles/titlestl.dart';
class Profile extends StatefulWidget {
const Profile({ Key? key }) : super(key: key);
@override
State<Profile> createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
  return Center(
  child: Text("Profile",style: textstyle(30,Colors.black,FontWeight.normal),),
  );
  }
}