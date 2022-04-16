import 'package:flutter/material.dart';
import 'package:progress/colors/colors.dart';
import 'package:progress/styles/titlestl.dart';
SliverAppBar appbar(String titiles,Color bgcolor){
      return SliverAppBar(
       bottom:PreferredSize(
         preferredSize: const Size(double.infinity, kToolbarHeight),
         child: SizedBox(
           height: 50,
           child: TabBar(
                 indicatorColor: Clr.green,
                 indicatorWeight: 5,
                 isScrollable: true,
                 tabs:[
                 Tab(icon:Icon(Icons.home,size: 15,color: Clr.black,),child: Text("Home",style: textstyle(10, Clr.black, FontWeight.normal),)),
                 Tab(icon:Icon(Icons.card_giftcard,size: 15,color: Clr.black,),child: Text("Result",style: textstyle(10, Clr.black, FontWeight.normal),)),
                 Tab(icon:Icon(Icons.list_alt,size: 15,color: Clr.black,),child: Text("News",style: textstyle(10, Clr.black, FontWeight.normal),)),
                 Tab(icon:Icon(Icons.person,size: 15,color: Clr.black,),child: Text("Profile",style: textstyle(10, Clr.black, FontWeight.normal),)),
               ]),),),
       actions:[action(Icons.notifications)],
       iconTheme: IconThemeData(color: Clr.black),
       shape: const RoundedRectangleBorder(borderRadius: 
       BorderRadius.only(
        bottomLeft:Radius.circular(30),bottomRight:Radius.circular(30),)),
        backgroundColor: bgcolor,
        elevation: 0.0,
        leadingWidth: 200,
        expandedHeight: 100,
        floating: true,
        flexibleSpace:FlexibleSpaceBar(
        titlePadding: const EdgeInsets.fromLTRB(70,0, 0, 70),
        centerTitle: true,
        title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(titiles,style: textstyle(20,Clr.red,FontWeight.bold),),
        ),),);
}
        Widget action(IconData? name){
        return IconButton(onPressed: (){}, icon: const Icon(Icons.notifications));
        }