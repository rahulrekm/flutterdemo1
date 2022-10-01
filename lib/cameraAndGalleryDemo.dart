import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main(){
  runApp(
    MaterialApp(
        home: CameraAndGalleryDemo()),
  );
}

class CameraAndGalleryDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => CameraAndGalleryDemoState();
}

class CameraAndGalleryDemoState extends State{

   File? imageDemo;
    File? iimage;

  Future getImage(ImageSource source) async {
    final imageDemo = await ImagePicker().pickImage(source: source);
   if(imageDemo == null) return;
   final imageTemp = File(imageDemo.path);
    setState(() {
      this.imageDemo = imageTemp;
    });

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Camera Demo"),),
      body:  Column(
        children: [

          imageDemo != null ? Image.file(imageDemo!, height: 400, width: MediaQuery.of(context).size.width,) :
          Image.network("https://fujifilm-x.com/wp-content/uploads/2021/09/rghs_GFX50SII_thumbnail.jpg",height: 400,width: 300,),
          SizedBox(height: 20,),
          
          ElevatedButton(onPressed: (){
            getImage(ImageSource.camera);
          }, child: Text("Camera")),

          SizedBox(height: 20,),

          ElevatedButton(onPressed: (){
            getImage(ImageSource.gallery);
          }, child: Text("Gallery"))
        ],
      ),
    );  }

  }

