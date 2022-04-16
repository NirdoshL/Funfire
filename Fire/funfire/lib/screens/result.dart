import 'package:flutter/material.dart';
import 'package:funfire/authentications/database.dart';
import 'package:funfire/UsersModel/firebaseresult.dart';
import 'package:funfire/screens/resultbody.dart';
import 'package:provider/provider.dart';


class Result extends StatefulWidget {
  const Result({ Key? key}) : super(key: key);
  @override
  State<Result> createState() => _ResultState();
  }
class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<FirebaseResult>>.value(
      value: Databases().data2,
      initialData: const[],
      child: const ResultBody()
    );
  }
}

