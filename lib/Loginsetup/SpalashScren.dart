
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project1/Login_Data_Store/Data_Store.dart';
import 'package:project1/Loginsetup/loginPage.dart';
import 'package:project1/NoteApp/noteapp.dart';

class SpalashScreen extends StatefulWidget {
  const SpalashScreen({super.key});

  @override
  State<SpalashScreen> createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {

  ScrenNavigatorFun()async{
    log("=========Timer start===");
    await Future.delayed(const Duration(seconds: 3));
   var savedata=await AppLocate().dataGetFun("login");
   if(savedata=="yes"){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Noteapp()));
   }
   else{
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginPage()));
   }
    log("=========Timer end===");
  }



  @override
  void initState() {
    ScrenNavigatorFun();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network("https://png.pngtree.com/png-vector/20220509/ourmid/pngtree-company-logo-design-trademark-design-creative-logo-png-image_4569380.png"),
      ),
    );
  }
}
