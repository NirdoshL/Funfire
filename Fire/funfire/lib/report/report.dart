import 'package:flutter/material.dart';
import 'package:funfire/authentications/database.dart';

class Report extends StatefulWidget {
  const Report({ Key? key,required this.uid,required this.fname}) : super(key: key);
  final String uid;
  final String fname;
  @override
  State<Report> createState() => _ReportState();
  }
class _ReportState extends State<Report> {
  Databases datas=Databases();
  TextEditingController textController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
          backgroundColor: Colors.black,
          body: SizedBox(
            child: Column(children:[
            const SizedBox(height: 10,),
            const  Text("Report Us/Feedback",style: TextStyle(color: Colors.red),),
            const Spacer(),
            TextFormField(
            controller: textController,
            style: const TextStyle(color: Colors.green),
            maxLength: 200,
            maxLines: 10,
            decoration:  InputDecoration(
            labelText: "Report/Feedback",
            labelStyle:const TextStyle(color: Colors.red),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
            borderSide:const BorderSide(color: Colors.green) ),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
            borderSide:const BorderSide(color: Colors.green) ),
            ),
            ),
            const SizedBox(height: 10,),
            TextButton(child: const  Text("Send",style: TextStyle(color: Colors.green),),
            onPressed: (){
            if(textController.text.isEmpty){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Sorry.Your Report is Empty")));
            }
            else{
            datas.reportToFirebase(textController.text, widget.uid,widget.fname);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Thank you for your Feedback.")));
            }   
            },),
            const SizedBox(height: 10,),
            ]),
          ),
          ),
    );
  }
}