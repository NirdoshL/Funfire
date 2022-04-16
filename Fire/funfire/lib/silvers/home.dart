import 'package:flutter/material.dart';
import 'package:funfire/UsersModel/user.dart';
import 'package:funfire/authentications/database.dart';
import 'package:funfire/UsersModel/firebasehome.dart';
import 'package:funfire/silvers/screenbody.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading=true;
  User? currentuser=FirebaseAuth.instance.currentUser;
  final CollectionReference collection=FirebaseFirestore.instance.collection('users');
  Users user=Users();
  @override
  void initState() {
    super.initState();
     collection.doc(currentuser!.uid).get().then((value) {
       user=Users.fromMap(value.data());
       setState(() {});
       if(user.image!=null){
         setState(() {isLoading=false;});
       }
       });
  
  }
  @override
    Widget build(BuildContext context) {
      return StreamProvider<List<Firebasehome>>.value(
        value: Databases().data1,
        initialData: const[],
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            body: DefaultTabController(
              length: 4,
              child: ScreenBody(
                uid:currentuser!.uid,
                image:"${user.image}",
                guildName: "${user.guildName}",
                fname:"${user.fname}",
                sname:"${user.sname}" ,
                email:"${user.email}",
                isloading:isLoading,
                phone: "${user.phone}",),
                      ),
                      drawer:const Drawer(),
                      ),
        ),
                   );
                  }}
     