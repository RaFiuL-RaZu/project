import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project1/NoteApp/noteapp.dart';

class EditScren extends StatefulWidget {
  const EditScren(
      {Key? key,
        required this.Create_at,
        required this.note,
        required this.index})
      : super(key: key);

  final DateTime Create_at;
  final String note;
  final int index;

  @override
  State<EditScren> createState() => _EditScrenState();
}

class _EditScrenState extends State<EditScren> {
  final _myKey = GlobalKey<FormState>();
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    noteController.text = widget.note;
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
              Expanded(
                child: TextFormField(
                  controller: noteController,
                  maxLength: 100,
                  maxLines: 15,
                  decoration: InputDecoration(
                      hintText: "Add your note",
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  //if(_myKey.currentState!.validate()){
                  // return;

                  // }
                  setState(() {});
                  Map<String, dynamic> notedata = {
                    "Create_at": DateTime.now(),
                    "note": noteController.text,
                  };
                  noteList
                      .replaceRange(widget.index - 1, widget.index, [notedata]);
                  Navigator.pop(context);
                },
                child: Card(
                  color: Color(0xfff272727),
                  child: SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Center(
                        child: Text(
                          "Update note",
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
