
class SliderModel {
  final String image;
  final String id;
  final String title;
  final String subtitle;

  SliderModel({
    required this.image,
    required this.id,
    required this.title,
    required this.subtitle,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    // final rawProducts = json['products'] as List<dynamic>? ?? [];
    return SliderModel(
      image: json['image'] ?? '',
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'id': id,
      'title': title,
      'subtitle': subtitle,
    };
  }
}
