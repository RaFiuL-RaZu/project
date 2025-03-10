

import 'package:flutter/material.dart';

class ModelclassTest extends StatefulWidget {
  const ModelclassTest({super.key});

  @override
  State<ModelclassTest> createState() => _ModelclassTestState();
}

class _ModelclassTestState extends State<ModelclassTest> {

  List studentInfo=[
    {"id":"102621","name":"Rafiul Razu","dept":"CSE","sec":"B"},
    {"id":"102622","name":"Rafiul Sazu","dept":"EEE","sec":"B"},
    {"id":"102623","name":"Rafiul Razu","dept":"CSE","sec":"B"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Model Class"),
        centerTitle: true,
      ),
      body:ListView.builder(
        itemCount: 3,
          itemBuilder: (context,index){
        return Card(
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${studentInfo[index]["id"]}"),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${studentInfo[index]["name"]}"),
                    Text("${studentInfo[index]["dept"]}"),
                  ],
                ),
                Spacer(),
                Text("${studentInfo[index]["sec"]}"),
              ],
            ),
          ),
        );
      }),


    );
  }
}
