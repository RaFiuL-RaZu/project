import 'dart:developer';
import 'package:project1/EComarce/Model/product.dart' show ProductModel;
import 'package:project1/EComarce/productList.dart';

class ProductController {
  static Future<List<ProductModel>> getProduct() async {
    await Future.delayed(Duration(seconds: 3));

    List<ProductModel> list = [];
    log("=======${list.length}");
    for (var i in productListDatabase().tshirtProducts) {
      log("========${i}====");
      ProductModel data = ProductModel.fromJson(i);
      list.add(data);
    }
    log("=======${list.length}");
    return list;
  }
}
