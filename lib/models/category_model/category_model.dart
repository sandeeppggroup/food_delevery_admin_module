class CategoryModel {
  dynamic id;
  String name;
  ImageCategory image;
  bool isBlocked;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isBlocked,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      name: json['name'],
      image: ImageCategory.fromJson(json['image']),
      isBlocked: json['isBlocked'],
    );
  }
}

class ImageCategory {
  String publicId;
  String imageUrl;

  ImageCategory({
    required this.publicId,
    required this.imageUrl,
  });

  factory ImageCategory.fromJson(Map<String, dynamic> json) {
    return ImageCategory(
      publicId: json['public_id'],
      imageUrl: json['image'],
    );
  }
}
