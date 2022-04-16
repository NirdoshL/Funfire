import 'package:flutter/material.dart';
import 'package:progress/colors/colors.dart';
import 'package:progress/screens/home/body/body.dart';
import 'package:progress/screens/home/drawer/drawer.dart';

import '../../images/images.dart';
import '../../styles/appbar.dart';
import '../../styles/titlestl.dart';
import '../khalti_pay/khaltimain.dart';

class Home extends StatefulWidget {
const Home({ Key? key }) : super(key: key);
@override
State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
final List<String> mylist=["Hari is good","Shyam is food","Bikram is hood","Fellow Gamers","helper","Sleeper"];
@override
Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Clr.appbarcolor,
        extendBodyBehindAppBar: true,
        body: const Body(),
        drawer: const Drawers(),
        ),
    );
  }
}
