import 'package:flutter/material.dart';
import 'package:funfire/silvers/appbar.dart';
import 'barcontroller.dart';
import '../screens/mainhome.dart';
import '../screens/news.dart';
import '../screens/registration.dart';
import '../screens/result.dart';

class ScreenBody extends StatelessWidget {
 const ScreenBody({ Key? key ,
   required this.email,
  required this.fname,
  required this.phone,
  required this.guildName,
  required this.image,
  required this.sname,
  required this.uid,
  required this.isloading}) : super(key: key);
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
    return NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                    AppBars(
                      uid:uid,
                      image:image,
                      guildName: guildName,
                      fname:fname,
                      sname:sname ,
                      email: email,
                      isloading: isloading,
                      phone: phone,),
                    SliverPersistentHeader(
                    delegate:SliverAppBarDelegate(
                    const TabBar(
                    indicatorWeight:.5,
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white38,
                    tabs: [
                    Tab(icon: Icon(Icons.home), text: "Home"),
                    Tab(icon: Icon(Icons.newspaper), text: "News"),
                    Tab(icon: Icon(Icons.notes), text: "My registration"),
                    Tab(icon: Icon(Icons.lightbulb_outline), text: "Result"),
                    ],
                    ),
                    ),
                    pinned: false,
                    floating: true,
                    ),
                    ];
                    },
              body:  const TabBarView(children:[
                    Home1(),
                    News(),
                    Registration(),
                    Result(),
                    ],),
                    );
  }         
}
