import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project1/NoteApp/noteapp.dart';


class NoteAddScren extends StatefulWidget {
  const NoteAddScren({Key? key}) : super(key: key);

  @override
  State<NoteAddScren> createState() => _NoteAddScrenState();
}

class _NoteAddScrenState extends State<NoteAddScren> {
  final _myKey = GlobalKey<FormState>();
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Create new card"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _myKey,
          child: Column(
            children: [
              CustomTextField(
                textController: noteController,
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  //if(_myKey.currentState!.validate()){
                  // return;

                  // }
                  setState(() {
                    Map<String, dynamic> notedata = {
                      "Create_at": DateTime.now(),
                      "note": noteController.text,
                    };
                    noteList.add(notedata);
                    Navigator.pop(context);
                  });
                },
                child: Card(
                  color: Color(0xfff272727),
                  child: SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Center(
                        child: Text(
                          "Save note",
                          style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.textController,
  }) : super(key: key);
  final TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: textController,
        maxLength: 100,
        maxLines: 15,
        decoration: InputDecoration(
            hintText: "Add your note",
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            fillColor: Color(0xfff272727),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            )),
        validator: (value) {
          if (value == null || value == "") {
            return "Field can not empty";
          } else if (value.length < 10) {
            return "must be 10 letter";
          }
          return null;
        },
      ),
    );
  }
}
