

import 'package:flutter/material.dart';

class ModelclassTest extends StatefulWidget {
  const ModelclassTest({super.key});

  @override
  State<ModelclassTest> createState() => _ModelclassTestState();
}

class _ModelclassTestState extends State<ModelclassTest> {
  StudentModel1 model=StudentModel1();

  dataCover(){
    var jsndata={"id":"102621","name":"Rafiul Razu","dept":"CSE","sec":"B"};
    model=StudentModel1.fromJson(jsndata);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${model.name}"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            dataCover();
            setState(() {

            });

          }, icon: Icon(Icons.refresh)),
        ],
      ),
      body:ListView.builder(
        itemCount: studentInfo1.length,
          itemBuilder: (context,index){
        return Card(
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${studentInfo1[index].id}"),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${studentInfo1[index].name}"),
                    Text("${studentInfo1[index].dept}"),
                  ],
                ),
                Spacer(),
                Text("${studentInfo1[index].sec}"),
              ],
            ),
          ),
        );
      }),


    );
  }
}


List studentInfo=[
  {"id":"102621","name":"Rafiul Razu","dept":"CSE","sec":"B"},
  {"id":"102622","name":"Rafiul Sazu","dept":"EEE","sec":"B"},
  {"id":"102623","name":"Rafiul Razu","dept":"CSE","sec":"B"},
];
List<myModel> studentInfo1=[
  myModel(102621, "RaFiul", "CSE", "B"),
  myModel(102622, "RaBiul", "CE", "B"),
  myModel(102623, "SaFiul", "EEE", "B"),
  myModel(102624, "ATiul", "ME", "B"),
];

class myModel{
  int? id;
  String? name;
  String? dept;
  String? sec;
  myModel(this.id,this.name,this.dept,this.sec);

}


class StudentModel1 {
  String? id;
  String? name;
  String? dept;
  String? sec;

  StudentModel1({this.id, this.name, this.dept, this.sec});

  StudentModel1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dept = json['dept'];
    sec = json['sec'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['dept'] = this.dept;
    data['sec'] = this.sec;
    return data;
  }
}
