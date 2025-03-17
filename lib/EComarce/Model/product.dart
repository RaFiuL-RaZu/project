

class ProductModel {
  String? image;
  String? name;
  int? regularPrice;
  int? offerPrice;

  ProductModel({this.image, this.name, this.regularPrice, this.offerPrice});

  ProductModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    regularPrice = json['regular_price'];
    offerPrice = json['offer_price'];
  }
}
