import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:project1/APICLass/Config.dart';
import 'package:project1/PracticeProject/ProductModelPart/PostDetailsModel.dart';
import 'package:project1/PracticeProject/ProductModelPart/PostModel.dart';

class ApiServices {
  static Future<List<PostModel>?> fetchData() async {
    final Url = Uri.parse(
      "https://cit-ecommerce-codecanyon.bandhantrade.com/api/app/v1/products",
    );
    final response = await http.get(Url);
    if (response.statusCode == 200) {
      print("Success");
      final jsonData = jsonDecode(response.body);
      final postList = jsonData['products'] as List;
      return postList.map((postjson) => PostModel.fromJson(postjson)).toList();

      // for(var posts in postList){
      //   post.add(PostModel.fromJson(posts));
      // }
      //
    } else {
      print("Failled");
      return null;
    }
  }

  static Future<PostDetailsModel?> singleGetFetch(String id) async {
    final UrL=Uri.parse("https://cit-ecommerce-codecanyon.bandhantrade.com/api/app/v1/products/show/1");
    final response = await http.get(UrL);

    if (response.statusCode == 200) {
      print("iiiiiiii");
      final decoded = jsonDecode(response.body);

      return PostDetailsModel.fromJson(decoded['product_details']);
    } else {
      print("Error is");
    }
  }
}
