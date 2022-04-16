import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:funfire/test/notification.dart';
import '../authentications/auth.dart';
import '../profile/imagepick.dart';
import '../report/report.dart';
import '../setting/settings.dart';

class Profile extends StatefulWidget {
  const Profile({ Key? key,required this.phone,required this.uid,required this.image,required this.guilName,required this.email,required this.sname,required this.fname}) : super(key: key);
  final String fname;
  final String uid;
  final String guilName;
  final String sname;
  final String email;
  final String image;
  final String phone;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
  final Authenticates _auth=Authenticates();
    return SafeArea(
          child: Scaffold(
          backgroundColor: Colors.black,  
          body:SingleChildScrollView(
          child: Column(children: [
          FlipCard(
          back:Container(decoration: const BoxDecoration(
          color: Color.fromARGB(255, 37, 49, 43),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),height: MediaQuery.of(context).size.height/2
          ,width: MediaQuery.of(context).size.width,
          child:Stack(
            children: [
              ListView(
                children:[ Column(
                children: [
                listTile("First Name",widget.fname,widget.image),
                listTile("Second Name",widget.sname,""),
                listTile("Email", widget.email,""),
                listTile("Guild", widget.guilName,""),
                ListTile(leading: Text("Settings",style: textStyle(Colors.red),),
                onTap:()=>{navigate(context,Settings(
                  image: widget.image,
                  guild:widget.guilName,
                  fname: widget.fname,
                  sname: widget.sname,
                  email: widget.email,))},),
                  ListTile(leading: Text("Notifications",style: textStyle(Colors.red),),
                onTap:()=>{
                  navigate(context,const NotificationScreen())},),
                const SizedBox(height: 30,),
                const Text("--About us--"),
                listTile("Contact us", "9823035048", "--"),
                listTile("Email us", "bimallamichhane2@gmail.com", "--"),
                ],
                ),
                 ] ),
            ],
          ),) ,        
          front:Container(decoration: const BoxDecoration(
          color: Color.fromARGB(255, 37, 49, 43),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),height: MediaQuery.of(context).size.height/2
          ,width: MediaQuery.of(context).size.width,
          child:Image.network(
          widget.image,fit: BoxFit.fill,),),),
          ListTile(leading: Text("Logout",style: textStyle(Colors.red),),
          onTap:()=>{_auth.signOut(context)},),
          ListTile(leading: Text("Report",style: textStyle(Colors.red),),
          onTap:()=>{navigate(context,Report(uid: widget.uid,fname: widget.fname,))},),
          ],),
          )),
    );
  }

ListTile  listTile(String leading,String trailing,String title){
  return  ListTile(
          title:(leading=="First Name")
          ?avaterClick(title)
          :Text(title) ,
          trailing: Text(trailing,
          style: textStyle(Colors.red),),
          leading: Text("$leading:-",
          style: textStyle(Colors.red),),);
}

TextStyle textStyle(Color color){
  return  TextStyle(
          color: color,
          fontSize: 18,
          fontWeight: FontWeight.bold
          );
     }
Widget avaterClick(String title){
  return TextButton(
   child: CircleAvatar(backgroundImage:NetworkImage(title),radius: 25,),
   onPressed:(){
     Navigator.push(context, MaterialPageRoute(builder: (context) => ImageUpload(uid: widget.uid, email: widget.email, fname: widget.fname, sname: widget.sname,phone: widget.phone, guildName: widget.guilName),));
   });
}
}
navigate(context,Widget wi){
  return  Navigator.push(context, MaterialPageRoute(builder: (context) => wi,));
}
