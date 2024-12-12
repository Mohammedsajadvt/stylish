class CategoriesModel {
  final String name;
  final String image;

  CategoriesModel({required this.name, required this.image});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      name: json['name'] as String? ?? '',  
      image: json['image'] as String? ?? '',  
    );
  }
}
