
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart' show EasyLoading;
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;


class localTestScren extends StatefulWidget {
  const localTestScren({super.key});

  @override
  State<localTestScren> createState() => _localTestScrenState();
}

class _localTestScrenState extends State<localTestScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: ()async{
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setInt("id",102621);
              EasyLoading.show();
             await Future.delayed(Duration(seconds: 3));
             // EasyLoading.dismiss();
              EasyLoading.showSuccess('Added succesfully');
            log("========Add Data=======");

            }, child:Text("Add Data")),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: ()async{
              final SharedPreferences prefs = await SharedPreferences.getInstance();
             var data= prefs.get("id");
             log("==========Show data: ${data}====");

            }, child:Text("Show Data")),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: ()async{
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove("id");
              log("==========delete data====");

            }, child:Text("Delete Data")),
          ],
        ),
      ),
    );
  }
}
