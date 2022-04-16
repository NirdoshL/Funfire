import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:provider/provider.dart';
import '../UsersModel/firebasehome.dart';

class Registration extends StatefulWidget {
  const Registration({ Key? key}) : super(key: key);
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    final datas=Provider.of<List<Firebasehome>>(context);
    return SizedBox(
      child: ListView.builder(
      itemCount: datas.length,
      itemBuilder: ((context, index) => FlipCard(
      back: Card(
        color: const Color.fromARGB(255, 37, 49, 43),
       shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(20)),
      child: AspectRatio(aspectRatio: 3,
      child: ListTile(
      leading: CircleAvatar( 
      radius: 20,
      backgroundImage:NetworkImage(
      "${datas[index].image}")
      ),
      title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
      Text("Game Code:  ${datas[index].code}",style: txt(),),
      const Spacer(),
      Text("Map:  ${datas[index].map}",style: txt(),),
      const Spacer(),
      Text("Date:  ${datas[index].date}",style: txt(),),
      const Spacer(),
      Text("Time:  ${datas[index].time}",style: txt(),)
      ]),
      ),
      ),),
      ),
      front: Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(20)),
      child: AspectRatio(aspectRatio: 3,
      child: ListTile(
      leading:CircleAvatar( 
      radius: 20,
      backgroundImage:NetworkImage(
      "${datas[index].image}")
      ),
      title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        const Spacer(),
      Text("Map:  ${datas[index].map}",style: txt(),),
      const Spacer(),
      Text("Date:  ${datas[index].date}",style: txt(),),
      const Spacer(),
      Text("Time:  ${datas[index].time}",style: txt(),)
      ]),
      ),
      ),
      ),
      ),     
      )
      )
      ),
    );
  }
}

TextStyle txt(){
  return const TextStyle(
  color: Colors.white
  );
}
