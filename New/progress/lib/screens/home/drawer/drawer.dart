import 'package:flutter/material.dart';
import 'package:progress/colors/colors.dart';
import 'package:progress/images/images.dart';
import 'package:progress/styles/titlestl.dart';
class Drawers extends StatelessWidget {
  const Drawers({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
          Drawer(
            backgroundColor: Clr.appbarcolor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                decoration:BoxDecoration(
                color: Clr.white,
                borderRadius: BorderRadius.circular(10)
                ),
                currentAccountPicture: CircleAvatar(radius:30,child: Image.asset(UsedImage.back,fit: BoxFit.fill,)),
                accountName:Text("Nirdosh Lamichhane",style: textstyle(13, Clr.red, FontWeight.w500),),
                accountEmail:Text("Nirdoshlamichhane@company.gmail.com",style: textstyle(10, Clr.red, FontWeight.w500),),
                ),
                listtile("Account", Icons.person),
                listtile("My Registration", Icons.app_registration_rounded),
                listtile("Settings", Icons.settings),
                listtile("Notification", Icons.notifications),
                listtile("Dark Theme", Icons.dark_mode),
                listtile("Logout", Icons.logout)
              ],
            ),
          );
  }
}
Widget listtile(String title,IconData icon){
  return ListTile(title: Text(title,style: textstyle(13, Clr.red, FontWeight.w500),),leading: Icon(icon,size:20,color: Clr.black,),);
}