import 'package:flutter/material.dart';
import 'package:fit/models/category_model.dart';
import 'dart:io'; // Import for File

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final Function onFavoriteToggle;

  const CategoryCard({
    super.key,
    required this.category,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(17),
            child: _buildImage(), // Use the helper method to build the image
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Text(
              category.categoryName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: IconButton(
              onPressed: () {
                onFavoriteToggle();
              },
              icon: Icon(
                category.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build the image widget
  Widget _buildImage() {
    // Check if the category has a valid image path
    if (category.imagePath != null && category.imagePath!.isNotEmpty) {
      final file = File(category.imagePath!);
      if (file.existsSync()) {
        // If the image file exists, show it
        return Image.file(
          file,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 150,
        );
      }
    }
    // If no image path or the file doesn't exist, show a placeholder
    return Image.asset(
      'assets/images/fullbody.jpeg', // Placeholder image
      fit: BoxFit.cover,
      width: double.infinity,
      height: 150,
    );
  }
}
