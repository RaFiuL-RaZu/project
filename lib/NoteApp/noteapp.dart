

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project1/Login_Data_Store/Data_Store.dart';
import 'package:project1/Loginsetup/loginPage.dart';
import 'package:project1/NoteApp/Addnote.dart';
import 'package:project1/NoteApp/WidgetCard.dart';

List<Map<String,dynamic>> noteList=[
  {"Create_at":DateTime.now(),
    "note":"",}
];

class Noteapp extends StatefulWidget {
  const Noteapp({Key? key}) : super(key: key);

  @override
  State<Noteapp> createState() => _NoteappState();
}

class _NoteappState extends State<Noteapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text("Note App"),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: "Search notes..",
                    contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 0),
                    fillColor: Color(0xfff272727),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )
                ),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: noteList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.95,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context,index){
                      return NoteCardWidget(i: index+1, data: noteList[index],);
                    }),
              ),
            ),
            ElevatedButton(onPressed: (){
              AppLocate().dataAllDeleteFun();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginPage()));
            }, child:Text("Log out")),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: ()async{
          await Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteAddScren()));
          setState(() {

          });
        },child: Icon(Icons.add,color: Colors.black,),),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}


