
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project1/Login_Data_Store/Data_Store.dart';

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
            ElevatedButton(onPressed: (){
            //   log("========Add Data=======");
            //   FlutterSecureStorage storage=FlutterSecureStorage();
            // await storage.write(key: "name", value: "Razu");
              AppLocate().dataInsertFun("name", "Razu");


            }, child:Text("Add Data")),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
             AppLocate().dataGetFun("name");

            }, child:Text("Show Data")),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              AppLocate().dataDeleteFun("name");

            }, child:Text("Delete Data")),
          ],
        ),
      ),
    );
  }
}
