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
            child: category.imagePath != null && category.imagePath!.isNotEmpty
                ? Image.file(
                    File(category.imagePath!),
                    fit: BoxFit.cover,
                    width: 370,
                    height: 150,
                  )
                : Image.asset(
                    'assets/images/fullbody.jpeg',
                    fit: BoxFit.cover,
                    width: 370,
                    height: 150,
                  ),
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
}
