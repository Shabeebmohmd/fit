import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

part 'category_model.g.dart';

@HiveType(typeId: 2)
class CategoryModel extends HiveObject {
  @HiveField(0)
  String categoryName;

  @HiveField(1)
  String boxName;

  @HiveField(2)
  bool isFavorite;

  @HiveField(3)
  String? imagePath;

  CategoryModel({
    required this.boxName,
    required this.categoryName,
    this.isFavorite = false,
    this.imagePath,
  });

  // Helper method to set image data
  void setImageData({String? filePath, String? base64Data}) {
    if (kIsWeb && base64Data != null) {
      imagePath = 'data:image/png;base64,$base64Data';
    } else if (!kIsWeb && filePath != null) {
      imagePath = filePath;
    }
  }

  // Helper method to get image data
  dynamic getImageData() {
    if (imagePath != null) {
      if (kIsWeb && imagePath!.startsWith('data:image')) {
        // It's a base64 image (web)
        return imagePath!.split(',')[1]; // Return base64 string
      } else if (!kIsWeb) {
        // It's a file path (mobile)
        return imagePath;
      }
    }
    return null;
  }
}
