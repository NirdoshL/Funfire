import 'package:flutter/material.dart';
import 'package:progress/colors/colors.dart';
import 'package:progress/images/images.dart';
import 'package:progress/screens/khalti_pay/khaltimain.dart';
import 'package:progress/styles/appbar.dart';
import 'package:progress/styles/titlestl.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final List<String> mylist=["Hari is good","Shyam is food","Bikram is hood","Fellow Gamers","helper","Sleeper"];
    return  DefaultTabController(
      length: 4,
      child: CustomScrollView(
        slivers:[ 
          appbar("FunFire!", Clr.appbarcolor),
          SliverList(
              delegate: SliverChildBuilderDelegate(
             (BuildContext context, int index) {
              return Card(
              color: Clr.white,
              shadowColor: Clr.littleblack,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(30)
              ),
              child:Column(
              children: [
              Card(child: Image.asset(UsedImage.soldier,fit: BoxFit.fill,height: 130,width: double.infinity,)),
              AspectRatio(
              aspectRatio: 8,
              child: ListTile(
              title: Text("Register Now",style: textstyle(16, Clr.red,FontWeight.bold),),
              subtitle: Text(mylist[index],style: textstyle(10, Clr.red,FontWeight.w500),),
              trailing: TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const KhaltiPaymentApp()));},
              child: Text("Click to Register",overflow:TextOverflow.ellipsis,
              maxLines: 5,style: textstyle(16, Clr.green,FontWeight.bold),)),
              )),
              ],), ); },
              childCount: mylist.length),
      ),],),
    );}
}