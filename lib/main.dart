

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart' show EasyLoading;
import 'package:project1/EasyStore.dart';
import 'package:project1/Local_test/local_test.dart';
import 'package:project1/Loginsetup/SpalashScren.dart';
import 'package:project1/Loginsetup/loginPage.dart';
import 'package:project1/NoteApp/noteapp.dart';

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
      home:localTestScren(),
    );
  }
  
}
