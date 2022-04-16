import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:funfire/UsersModel/guildmodel.dart';
import 'package:funfire/UsersModel/reports.dart';
import 'package:funfire/UsersModel/user.dart';
import 'package:funfire/UsersModel/firebasehome.dart';
import 'package:funfire/UsersModel/firebaseresult.dart';
import '../UsersModel/firebasehome.dart';


class Databases{
  final String? uid;
  Databases({this.uid});
  final CollectionReference collection=FirebaseFirestore.instance.collection('users');
  Users users=Users();
  GuildModel guildModel=GuildModel();
  FirebaseReport reports=FirebaseReport();
  // if new user comes-in or user change his/her identity
  Future update(
    String email,
    String fname,
    String sname,
    String guildName,
    String phone,
    String image)async{
  //this will update all values in users class
       users.uid=uid;
       users.guildName=guildName;
       users.email=email;
       users.fname=fname;
       users.sname=sname;
       users.phone=phone;
       users.image=image; 
       //updating name in guild if any changes made
       guildMembers(guildName,fname);
       //this will send updated values  tomap() or simply firestore
      await collection.doc(users.uid).set(
        users.toMap()
      );
  }
  //guild collections updates 
  Future guildMembers(String guildname,String fname)async{
        guildModel.guildName=guildname;
        guildModel.fname=fname;
        await FirebaseFirestore.instance.collection("GuildMember").doc(guildname).collection(guildname).doc(fname).set(
         guildModel.toMap()
        );
  }

  //report to firebase
  Future reportToFirebase(String report,String uid,String fname)async{
        reports.report=report;
        await FirebaseFirestore.instance.collection('Reports').doc(uid).collection(fname).doc(DateTime.now().toString()).set(reports.toMap());
  }
// firebase home and registration.
List<Firebasehome> _firebasehome(QuerySnapshot snapshot){
  return snapshot.docs.map((doc){
    return Firebasehome(
      map: doc.get('map')??'',
      title: doc.get('title')??'',
      date: doc.get('date')??'',
      time: doc.get('time')??'',
      fee: doc.get('fee')??'',
      code: doc.get('code')??'',
      image: doc.get('image')??'');
  }).toList();
}

  Stream<List<Firebasehome>> get data1{
    return FirebaseFirestore.instance.collection('dummy').snapshots()
    .map(_firebasehome);
  }

List<FirebaseResult> _firebaseresult(QuerySnapshot snapshot){
  return snapshot.docs.map((doc){
    return FirebaseResult(
     name:doc.get('name')??'',
     guildName:doc.get('guildName')??'',
     matchName: doc.get('matchName')??'',
     kill: doc.get('kill')??'',
     points: doc.get('points')??'');
  }).toList();
}

  Stream<List<FirebaseResult>> get data2{
    return FirebaseFirestore.instance.collection('rslt').snapshots()
    .map(_firebaseresult);
  }}