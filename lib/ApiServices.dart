
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project1/APICLass/PostModel.dart';
class ApiServices{
 static Future<List<PostModel>?> fetchData() async {
    final Url = Uri.parse(
      "https://cit-ecommerce-codecanyon.bandhantrade.com/api/app/v1/products",
    );
    final response = await http.get(Url);
    if (response.statusCode == 200) {
      print("Success");
      print(response.body.runtimeType);
      final jsonData = jsonDecode(response.body);
      final postList = jsonData['products'] as List;
      return postList.map((postjson)=>PostModel.fromJson(postjson)).toList();

      // for(var posts in postList){
      //   post.add(PostModel.fromJson(posts));
      // }
      //
    } else {
      print("Failled");
      return null;
    }
  }
}
