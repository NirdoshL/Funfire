import 'package:get/get.dart';
import 'package:asmin/intro.dart';
import 'package:asmin/text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Forms extends StatefulWidget {
  const Forms({ Key? key }) : super(key: key);
 

  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
   final fkey=GlobalKey<FormState>();
   TextEditingController textcontroller=TextEditingController();
   TextEditingController emailcontroller=TextEditingController();
   TextEditingController passwordcontroller=TextEditingController();
   TextEditingController cpasswordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Form(
        key: fkey,
        child:SingleChildScrollView(
          child: Column(children: [
                SizedBox(
                height: 200,
                width: 200,  
                child: Image.asset('images/school.jpg',fit: BoxFit.fill,)),
                const SizedBox(height: 10,),
                neutext('Register Form!',Colors.black),
                const SizedBox(height: 10,),
                neutextfield(textcontroller, false, TextInputType.phone,"Name","Your Full Name:"),
                const SizedBox(height: 10,),
                neutextfield(emailcontroller, false, TextInputType.phone,"E-mail","Your E-mail:"),
                const SizedBox(height: 10,),
                neutextfield(passwordcontroller, true, TextInputType.phone,"Password","Password:"),
                const SizedBox(height: 10,),
                neutextfield(cpasswordcontroller, true, TextInputType.phone,"Conform Password","Conform Password:"),
                const SizedBox(height: 10,),
                text('Are You Student or teacher?', 20, Colors.green),
                const SizedBox(height: 10,),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                NeumorphicRadio(
                value: 1,
                child: text('Teacher', 13, Colors.green),
                ),
                NeumorphicRadio(
                value: 2,
                child: text('Student', 13, Colors.green),)
                ],
                ),
                const SizedBox(height: 30,),
                TextButton(child:text('Register', 20, Colors.green) ,
                onPressed: (){
                Get.offAll(intro(Colors.black));
                },)
             ],),
          )
       ),
    );
  }
}
Widget neutextfield(TextEditingController textcontroller,bool isobsecure,TextInputType type,String hint,String pref){
  return  Neumorphic(
                style: NeumorphicStyle(
                shape: NeumorphicShape.convex,
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
                ),
                child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                controller:textcontroller ,
                autocorrect: false,
                keyboardType:type ,
                obscureText: isobsecure,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                suffix: Text(hint),
                helperText: pref,
                ),
              ),
            ),
          );
}

Widget neutext(String title,Color color){
  return Neumorphic(
                style: NeumorphicStyle(
                shape: NeumorphicShape.convex,
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
                shadowLightColor: Colors.red,
                lightSource: LightSource.topRight,
                color: color,
                ),
                child:SizedBox(
                child: NeumorphicText(
                title,
                textAlign: TextAlign.center,
                textStyle: NeumorphicTextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                      
               ),
             ),
           ),
         );
}