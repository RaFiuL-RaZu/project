import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1/APICLass/PostModel.dart';
import 'package:project1/ApiServices.dart';

class DataSHowSCreen extends StatefulWidget {
  const DataSHowSCreen({super.key});

  @override
  State<DataSHowSCreen> createState() => _DataSHowSCreenState();
}

class _DataSHowSCreenState extends State<DataSHowSCreen> {
  List<PostModel> post = [];



  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   fetchData();
  // }
  // fetchData()async{
  //   final data=await ApiServices.fetchData();
  //   print(data!.length);
  //   setState(() {
  //     post=data;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Learning Process"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body:FutureBuilder(future:ApiServices.fetchData(), builder:(context,snapshot){

        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.builder(
            itemCount:snapshot.data!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder:(context,index){
              final data=snapshot.data![index];
              return Card(
                child: SizedBox(
                  height: 150,
                  width: 100,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          color: Colors.grey,
                          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFYqoKTu_o3Zns2yExbst2Co84Gpc2Q1RJbA&s",fit: BoxFit.fill,),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Name : ${data.name_en}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                          Text("Regular Price : ${data.reg_price}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                          Text("Discount Price : ${data.brand}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      })
    );
  }
}
