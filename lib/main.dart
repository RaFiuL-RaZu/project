

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart' show EasyLoading;
import 'package:project1/PracticeProject/FrontPart/FrontScreen.dart';
import 'package:project1/PracticeProject/ProductModelPart/PostModel.dart';
import 'package:project1/APICLass/ShowDataSCren.dart';
import 'package:project1/EasyStore.dart';
import 'package:project1/PracticeProject/ApiPart/ApiServices.dart';
import 'package:project1/Loginsetup/loginPage.dart';


void main(){
  EasySetting().setting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      home:FontScreen(),
    );
  }
  
}
