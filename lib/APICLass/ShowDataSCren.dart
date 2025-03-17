import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1/APICLass/PostModel.dart';

class DataSHowSCreen extends StatefulWidget {
  const DataSHowSCreen({super.key});

  @override
  State<DataSHowSCreen> createState() => _DataSHowSCreenState();
}

class _DataSHowSCreenState extends State<DataSHowSCreen> {
  List<PostModel> post = [];

  Future fetchData() async {
    final Url = Uri.parse(
      "https://cit-ecommerce-codecanyon.bandhantrade.com/api/app/v1/products",
    );
    final response = await http.get(Url);
    if (response.statusCode == 200) {
      print("Success");
      print(response.body.runtimeType);
      final jsonData = jsonDecode(response.body);
      final postList = jsonData['products'] as List;
      print(postList.length);
      
      for(var posts in postList){
        post.add(PostModel(
          image: posts[''],
            name_en:posts['name_en'],
            reg_price: posts['reg_price'],
            brand:posts['brand'],
        ));
      }
      //post = postList;
     print(post.length);
      setState(() {});
    } else {
      print("Failled");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Learning Process"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body:GridView.builder(
          itemCount:post.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder:(context,index){
              final data=post[index];
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
                          child: Image.network("https://cit-ecommerce-codecanyon.bandhantrade.com/images/product/240523-PMXZVT.png",fit: BoxFit.fill,),
                        ),
                      ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
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
            }),
    );
  }
}
