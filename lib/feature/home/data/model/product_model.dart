class ProductModel {
  final String id;
  final String name;
  final String categoryName;
  final String description;
  final String image;
  final double price;
  final int discount;
  final double rate;
  final int rateCount;
  final bool isVaforat;
  final int saleCount;
  final List<Map<String, dynamic>> reviews;

  ProductModel({
    required this.id,
    required this.name,
    required this.categoryName,
    required this.description,
    required this.image,
    required this.price,
    required this.discount,
    required this.rate,
    required this.rateCount,
    required this.isVaforat,
    required this.saleCount,
    required this.reviews,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      categoryName: json['categoryName'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      discount: (json['discount'] ?? 0).toInt(),
      rate: (json['rate'] ?? 0).toDouble(),
      rateCount: (json['rateCount'] ?? 0).toInt(),
      isVaforat: json['isVaforat'] ?? false,
      saleCount: (json['saleCount'] ?? 0).toInt(),
      reviews: List<Map<String, dynamic>>.from(json['reviews'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'categoryName': categoryName,
      'description': description,
      'image': image,
      'price': price,
      'discount': discount,
      'rate': rate,
      'rateCount': rateCount,
      'isVaforat': isVaforat,
      'saleCount': saleCount,
      'reviews': reviews,
    };
  }
}
