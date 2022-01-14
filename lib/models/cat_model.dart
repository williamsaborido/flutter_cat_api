import 'dart:convert';

class CatModel {
  final String id;
  final double width;
  final double height;
  final String url;

  CatModel({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'url': url,
    };
  }

  factory CatModel.fromMap(Map<String, dynamic> map) {
    return CatModel(
      id: map['id'] ?? '',
      width: map['width']?.toDouble() ?? 0.0,
      height: map['height']?.toDouble() ?? 0.0,
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CatModel.fromJson(String source) =>
      CatModel.fromMap(json.decode(source));
}
