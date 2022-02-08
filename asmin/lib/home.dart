import 'package:asmin/appbar_and_body.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _items = [
    home(),
    notice(),
    calender(),
    note(),
    result(),
  ];
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: appBar(Colors.white, "Asmin",20),
      drawer: drawer(),
      body: Center(
        child: IndexedStack(
          index: _currentindex,
          children: _items
        ),
      ),
      bottomNavigationBar: bottombar(),
    );
  }
  Widget bottombar(){
  void _ontap(int index){
  _currentindex=index;
  setState((){

  });
  }
  return BottomNavigationBar(
  onTap:_ontap,
  currentIndex: _currentindex,
  unselectedItemColor: Colors.white24,
  items:const [
  BottomNavigationBarItem(icon: Icon(Icons.home),backgroundColor: Colors.black87,label:'Home'),
  BottomNavigationBarItem(icon: Icon(Icons.warning),backgroundColor: Colors.black87,label:'Notice'),
  BottomNavigationBarItem(icon: Icon(Icons.calendar_today),backgroundColor: Colors.black87,label:'Calender'),
  BottomNavigationBarItem(icon: Icon(Icons.note),backgroundColor: Colors.black87,label:'Notes'),
  BottomNavigationBarItem(icon: Icon(Icons.notes),backgroundColor: Colors.black87,label:'Result'),
  ]);
}

}
