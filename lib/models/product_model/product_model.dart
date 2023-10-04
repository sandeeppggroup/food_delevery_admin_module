class ProductModel {
  ImageProduct image;
  dynamic id;
  String name;
  dynamic categoryId;
  int price;
  bool isBlocked;
  String description;

  ProductModel({
    required this.image,
    required this.id,
    required this.name,
    required this.categoryId,
    required this.price,
    required this.isBlocked,
    required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        image: ImageProduct.fromJson(json['image']),
        id: json['_id'],
        name: json['name'],
        categoryId: json['category'],
        price: json['price'],
        isBlocked: json['isBlocked'],
        description: json['description']);
  }
}

class ImageProduct {
  String imageUrl;
  dynamic imageId;

  ImageProduct({
    required this.imageUrl,
    required this.imageId,
  });

  factory ImageProduct.fromJson(Map<String, dynamic> json) {
    return ImageProduct(imageUrl: json['imageUrl'], imageId: json['imageId']);
  }
}
