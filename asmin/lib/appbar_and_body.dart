import 'package:asmin/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

PreferredSizeWidget appBar(Color color,String title,double size){
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.black,
    title: 
    text(title, size, color),
  );
}

Widget drawer(){
  return Drawer(
  backgroundColor: Colors.black,
  child: Column(
  children: [
  const CircleAvatar(
  radius: 80,
  backgroundColor: Colors.white,
  child: CircleAvatar(
  radius: 50,
  backgroundColor: Colors.black,
  ),
  ),
  const LinearProgressIndicator(value: 0,),
  ListTile(
  title: text("Setting",10,Colors.white),
  ),
  ListTile(
  title: text("Profile",10,Colors.white),
  ),
  ListTile(
  title: text("About",10,Colors.white),
  ),
  ],
  ),
  );
}

Widget home(){
  return SingleChildScrollView(
    child: Column(
      children: [
        Image.asset('images/school.jpg'),
      ],
    ),
  );
}
Widget note(){
  return SingleChildScrollView(
    child: Column(
      children: [
        Row(
        children:[Neumorphic(
           style: NeumorphicStyle(
                shape: NeumorphicShape.convex,
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
                lightSource: LightSource.topRight,
                ),
        child: Card(
          child:Image.asset('images/school.jpg',fit: BoxFit.fill,) ,
        ),
        ),
        ])
      ],
    ),
  );
}
Widget result(){
  return SingleChildScrollView(
    child: Column(
      children: [
        Image.asset('images/school.jpg'),
      ],
    ),
  );
}
Widget notice(){
  return SingleChildScrollView(
    child: Column(
      children: [
        Image.asset('images/school.jpg'),
      ],
    ),
  );
}
Widget calender(){
  return SingleChildScrollView(
    child: Column(
      children: [
        Image.asset('images/school.jpg'),
      ],
    ),
  );
}