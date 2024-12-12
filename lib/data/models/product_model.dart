class ProductModel {
  final String name;
  final String description;
  final String image;
  final String price;
  final String rating;

  ProductModel(
      {required this.name,
      required this.description,
      required this.image,
      required this.price,
      required this.rating});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        name: json['name'] as String? ?? '',
        description: json['description'] as String? ?? '',
        image: json['image'] as String? ?? '',
        price: json['price'] as String? ?? '',
        rating: json['rating'] as String? ?? '');
  }
}
