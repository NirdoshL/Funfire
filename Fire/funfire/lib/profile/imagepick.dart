import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../authentications/database.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({ Key? key,
  required this.uid,
  required this.email,
  required this.fname,
  required this.sname,
  required this.guildName,
  required this.phone}) : super(key: key);
 final String? uid;
 final String? email;
 final String? fname;
 final String? sname;
 final String? guildName;
 final String? phone;
  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? _image;
  final imagePicker=ImagePicker();
  String? downloadUrl;
  Future imagePickerMethod()async{
    final pick=await imagePicker.pickImage(source: ImageSource.gallery,imageQuality: 50);
    setState(() {
      if(pick!=null){
        _image=File(pick.path);
      }
    });
  }

Future uploadImage()async{
  Databases data=Databases(uid:widget.uid);
  final postID=DateTime.now().millisecondsSinceEpoch.toString();
  Reference ref=FirebaseStorage.instance.ref().child('${widget.uid}/images').child("post_$postID");
  await ref.putFile(_image!);
  downloadUrl=await ref.getDownloadURL();
  data.update(
  "${widget.email}", 
  "${widget.fname}", 
  "${widget.sname}", 
  "${widget.guildName}",
  "${widget.phone}",
  "$downloadUrl"
   );
   setState(() {});
}


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: Padding(
          padding:const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 500,
            width: double.infinity,
            child:Column(
              children: [
                const Text("Upload Image",style: TextStyle(color: Colors.red),),
                const SizedBox(height: 10,),
                Expanded(
                  flex: 4,
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.red)
                      ),
                      child: Center(child: Column(children: [
                        Expanded(child: 
                        _image==null?const Center(child: Text("No image selected"),):
                        Image.file(_image!)),
                        ElevatedButton(onPressed:(){
                          imagePickerMethod();
                        },
                         child:const Text("Select image"),
                        ),
                       const SizedBox(height: 10,),
                        ElevatedButton(onPressed:(){
                          if(_image!=null){
                          uploadImage().whenComplete(() =>
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Image Upload successful"))));
                          }else{
                           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Image not selected"))); 
                          }
                         
                        },
                         child:const Text("Upload image"),
                        )
                      ],)),
                    ),
                  ) )
              ],
            ) ),
          )),
      ),
    );
  }
}