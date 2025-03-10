

import 'package:flutter/material.dart';

class ModelclassTest extends StatefulWidget {
  const ModelclassTest({super.key});

  @override
  State<ModelclassTest> createState() => _ModelclassTestState();
}

class _ModelclassTestState extends State<ModelclassTest> {
 List<StudentModel1> model=<StudentModel1>[];

  dataCover(){
    for(var i in studentInfo){
    var jsndata= StudentModel1.fromJson(i);
    model.add(jsndata);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Model Class"),
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
        itemCount: model.length,
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
                    Text("${model[index].name}"),
                    Text("${model[index].dept}"),
                  ],
                ),
                Spacer(),
                Text("${model[index].sec}"),
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
