class CarouselModel {
  final String image;

  CarouselModel({required this.image});

  factory CarouselModel.fromJson(Map<String, dynamic> json) {
    return CarouselModel(
      image: json['image'] as String,
    );
  }
}
