class PostModel {
  final int productId;
  final String name_en;
  final int reg_price;
  final String? dis_price;
  final String? image;
  final String brand;
  PostModel({
    required this.productId,
    required this.name_en,
    required this.reg_price,
    this.dis_price,
    this.image,
    required this.brand,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(name_en:json['name_en'], reg_price:json['reg_price'], brand:json['brand'], productId:json['productId']);
  }
}
