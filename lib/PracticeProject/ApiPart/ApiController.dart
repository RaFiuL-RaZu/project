
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project1/PracticeProject/ProductModelPart/PostModel.dart';

class ApiController{
  static Future<List<PostModel>?> fetchData()async {
    final UrL=Uri.parse("https://cit-ecommerce-codecanyon.bandhantrade.com/api/app/v1/products");
    final response=await http.get(UrL);
    if(response.statusCode==200){
      final jsonData=jsonDecode(response.body);
      final postList=jsonData['products'] as List;
      return postList.map((postjson)=>PostModel.fromJson(postjson)).toList();
    }
    else{
      print("Error");
      return null;
    }

  }
}