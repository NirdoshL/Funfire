import 'package:flutter/material.dart';
import 'package:funfire/UsersModel/firebaseresult.dart';
import 'package:provider/provider.dart';

class ResultBody extends StatefulWidget {
  const ResultBody({ Key? key }) : super(key: key);

  @override
  State<ResultBody> createState() => _ResultBodyState();
}

class _ResultBodyState extends State<ResultBody> {
  @override
  Widget build(BuildContext context) {
    late int x;
    final result=Provider.of<List<FirebaseResult>>(context);
    setState(() {
      if(result.length>10){
        x=10;
      }
      else{
        x=result.length;
      }
    });
    return 
        SizedBox(
      child: ListView.builder(
      itemCount:x,
      itemBuilder: ((context, index) => Card(
      color: const Color.fromARGB(255, 37, 49, 43),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
      side: const BorderSide(color: Colors.red)),
      child: AspectRatio(aspectRatio: 3,
      child: ListTile(
      title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
      Text("Match Name:  ${result[index].matchName}",style: txt(),),
      const Spacer(),  
      Text("Name:  ${result[index].name}",style: txt(),),
      const Spacer(),
      Text("Guild Name:  ${result[index].guildName}",style: txt(),),
      const Spacer(),
      Text("Total Kill:  ${result[index].kill}",style: txt(),),
      const Spacer(),
      Text("Total Points:  ${result[index].points}",style: txt(),),]),
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