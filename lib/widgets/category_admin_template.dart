import 'package:fit/db/db_functions.dart';
import 'package:fit/models/category_model.dart';
import 'package:fit/screens/settings/admincategory/edit_category.dart';
import 'package:flutter/material.dart';

class CategoryAdminCard extends StatelessWidget {
  final String categoryname;
  final CategoryModel categoryModel;
  final int index;
  const CategoryAdminCard({
    super.key,
    required this.categoryname,
    required this.categoryModel,
    required this.index,
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
            child: Image.asset(
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
              categoryname,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditCategory(
                                  categoryModel: categoryModel,
                                  index: index,
                                )));
                  },
                  icon: const Icon(
                    Icons.edit_square,
                    color: Colors.amber,
                  )))
        ],
      ),
    );
  }
}
