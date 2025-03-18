class PostDetailsModel {
  final String rating;
  final String review;
  final String product_stock;
  final String description;
  final String image;
  PostDetailsModel({
    required this.rating,
    required this.review,
    required this.product_stock,
   required this.image,
    required this.description,
  });

  factory PostDetailsModel.fromJson(Map<String, dynamic> json) {
    return PostDetailsModel(
      rating: json['rating'],
      review: json['review'],
      product_stock: json['product_stock'],
      description: json['description'], image: json['image'],
    );
  }
}
