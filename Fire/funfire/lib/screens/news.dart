import 'package:flutter/material.dart';

class News extends StatefulWidget {
  const News({ Key? key }) : super(key: key);
  @override
  State<News> createState() => _NewsState();
}
class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10)),
        child: const Center(child:Text("InternalError!! Server is busy",style: TextStyle(color: Colors.red),) ,
        ),
    );
  }
}