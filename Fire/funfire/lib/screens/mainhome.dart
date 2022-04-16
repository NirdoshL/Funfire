import 'package:flutter/material.dart';
import 'package:funfire/UsersModel/firebasehome.dart';
import '../Payment/khaltimain.dart';
import 'package:provider/provider.dart';





class Home1 extends StatefulWidget {
  const Home1({ Key? key}) : super(key: key);
  @override
  State<Home1> createState() => _HomeState();
  }
class _HomeState extends State<Home1> {
  bool isloading=true;
  @override
  Widget build(BuildContext context) {
    late int x;
    final datas=Provider.of<List<Firebasehome>>(context);
    setState(() {
      if(datas.isNotEmpty){
        isloading=false;
       if(datas.length>10){
        x=10;
      }
      else{
        x=datas.length;
      }}else{
        isloading=true;
      }
    }); 
  return 
      (isloading)?const Center(child: CircularProgressIndicator()):SizedBox(
      child: ListView.builder(
      itemCount:x,
      itemBuilder: ((context, index) => Card(
      color: const Color.fromARGB(255, 37, 49, 43),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
      side: const BorderSide(color: Colors.red)),
      child: AspectRatio(aspectRatio: 3,
      child: ListTile(
      leading: CircleAvatar( 
      radius: 20,
      backgroundImage:NetworkImage("${datas[index].image}")),
      title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
      Text("Game:  ${datas[index].title}",style: txt(),),
      const Spacer(),
      Text("Map:  ${datas[index].map}",style: txt(),),
      const Spacer(),
      Text("Date:  ${datas[index].date}",style: txt(),),
      const Spacer(),
      Text("Time:  ${datas[index].time}",style: txt(),),]),
      ),
      trailing: Padding(
      padding: const EdgeInsets.fromLTRB(0, 25, 25, 0),
      child: TextButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder:(context)=>KhaltiPaymentApp(fee:"${datas[index].fee}") ));
      },
      child: Text("Buy Ticket",style: txt(),)),
      ),
      ),
      ),        
      ))
      ),
      );
    }
}

TextStyle txt(){
  return const TextStyle(
  color: Colors.white
  );
  }