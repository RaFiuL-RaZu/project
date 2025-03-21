import 'package:flutter/material.dart';
import 'package:project1/PracticeProject/ApiPart/ApiServices.dart';
import 'package:project1/APICLass/ApiServices1.dart';
import 'package:project1/PracticeProject/ProductModelPart/PostDetailsModel.dart';

class Postdetails extends StatelessWidget {
  final String postId;
  const Postdetails({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(postId), centerTitle: true),
      body:FutureBuilder(future: ApiServices.singleGetFetch(postId), builder:(context,snapshot){
        return Column(
          children: [
            Text("${snapshot.data?.rating}"),
          ],
        );
      }
      ),
    );
  }
}
