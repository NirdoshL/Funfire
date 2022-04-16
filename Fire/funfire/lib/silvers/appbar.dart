import 'package:flutter/material.dart';

import '../profile/profile.dart';

class AppBars extends StatelessWidget {
  const AppBars({ Key? key,
  required this.email,
  required this.fname,
  required this.guildName,
  required this.image,
  required this.sname,
  required this.phone,
  required this.uid,
  required this.isloading }) : super(key: key);
  final String image;
  final String uid;
  final String guildName;
  final String fname;
  final String sname;
  final String email;
  final bool isloading;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    backgroundColor: Colors.black,
                    expandedHeight: 100.0,
                    floating: true,
                    pinned: true,
                    actions: [
                    TextButton(
                    onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>
                    Profile(
                     uid:uid,
                     image:image,
                     guilName: guildName,
                     fname:fname,
                     sname:sname,
                     email: email,
                     phone: phone,)));
                    },
                    child: CircleAvatar(backgroundImage:
                    NetworkImage(image),
                    radius: 20,),
                    )
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title:SizedBox(
                    height: MediaQuery.of(context).size.height/12.5,
                    width:MediaQuery.of(context).size.width/5.5,
                    child:Image.asset('images/a.gif',fit: BoxFit.fill,),),
                    background:isloading?const Center(child: CircularProgressIndicator()) :Container(color: Colors.black,)),
                     );
  }
}