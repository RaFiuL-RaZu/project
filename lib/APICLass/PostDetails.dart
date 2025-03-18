import 'package:flutter/material.dart';
import 'package:project1/APICLass/ApiServices.dart';
import 'package:project1/APICLass/PostDetailsModel.dart';

class Postdetails extends StatelessWidget {
  final String postId;
  const Postdetails({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(postId), centerTitle: true),
      body: FutureBuilder<PostDetailsModel?>(
        future: ApiServices.singleGetFetch(postId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(children: [Text(snapshot.data!.rating)]);
          }
        },
      ),
    );
  }
}
