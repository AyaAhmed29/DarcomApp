import 'package:darcom_app/feature/home/data/model/product_model.dart';

class CategoryModel {
    
  final String imageUrl;
  final String id;
  final String name;
  final List<ProductModel> products;

  CategoryModel({
    required this.imageUrl,
    required this.id,
    required this.name,
    required this.products,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    final rawProducts = json['products'] as List<dynamic>? ?? [];
    return CategoryModel(
      imageUrl: json['imageUrl'] ?? '',
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      products: rawProducts
          .map((e) => ProductModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'id': id,
      'name': name,
      'products': products.map((p) => p.toJson()).toList(),
    };
  }
}
