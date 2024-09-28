import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String categoryname;

  const CategoryCard({
    super.key,
    required this.categoryname,
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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 35,
                  )))
        ],
      ),
    );
  }
}
