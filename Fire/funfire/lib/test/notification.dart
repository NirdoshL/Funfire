import 'package:flutter/material.dart';
import 'package:funfire/UsersModel/notificationmodel.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({ Key? key }) : super(key: key);
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}
class _NotificationScreenState extends State<NotificationScreen> {
  String notificationTitle="Title1";
  String notificationData="Title2";
  String notificationBody="Title3";
  @override
  void initState() {
    final firebaseMessaging=Notify();
    firebaseMessaging.setNotification();
    firebaseMessaging.streamCtrl.stream.listen(_changeData);
    firebaseMessaging.titleCtrl.stream.listen(_changetitle);
    firebaseMessaging.bodyCtrl.stream.listen(_changebody);
    super.initState();
  }
  _changeData(String msg)=>setState(() =>notificationData=msg);
  _changetitle(String msg)=>setState(() =>notificationTitle=msg);
  _changebody(String msg)=>setState(() =>notificationBody=msg);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( 
        body: Card(
            color: Colors.black,
            shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10)),
            child: Center(
              child:Column(
              children: [
                SizedBox(height: 50,),
                Text(notificationTitle,style: const TextStyle(color: Colors.red),),
                Text(notificationBody,style: const TextStyle(color: Colors.red),),
                Text(notificationData,style: const TextStyle(color: Colors.red),),
              ],
            ) ,
            ),
        ),
      ),
    );
  }
}