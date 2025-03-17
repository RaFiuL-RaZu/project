

class PostModel {
  final String name_en;
  final int reg_price;
  final String ? dis_price;
  final String ? image;
  final String brand;
  PostModel({
    required this.name_en,
    required this.reg_price,
    this.dis_price,
    this.image,
    required this.brand,
  });
}
