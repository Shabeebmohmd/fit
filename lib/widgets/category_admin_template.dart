import 'dart:io';

import 'package:fit/db/db_functions.dart';
import 'package:fit/models/category_model.dart';
import 'package:fit/screens/settings/admin/category/edit_category.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class CategoryAdminCard extends StatefulWidget {
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
  State<CategoryAdminCard> createState() => _CategoryAdminCardState();
}

class _CategoryAdminCardState extends State<CategoryAdminCard> {
  File? imageFile;

  @override
  void initState() {
    super.initState();
    _initializeImage();
  }

  void _initializeImage() {
    if (widget.categoryModel.imagePath != null &&
        widget.categoryModel.imagePath!.isNotEmpty) {
      final file = File(widget.categoryModel.imagePath!);
      if (file.existsSync()) {
        setState(() {
          imageFile = file;
        });
      }
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        widget.categoryModel.imagePath = pickedFile.path;
        final box = Hive.box<CategoryModel>('category');
        box.putAt(widget.index, widget.categoryModel);
        loadCategories();
      });
    }
  }

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
            child: _buildImage(),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Card(
              color: Colors.black,
              child: Text(
                widget.categoryname,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: _pickImage,
                child: const Icon(
                  Icons.add_a_photo,
                  color: Colors.white,
                )),
          ),
          Positioned(
              bottom: 70,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditCategory(
                        categoryModel: widget.categoryModel,
                        index: widget.index,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: Icon(
                  Icons.edit_square,
                  color: Colors.amber,
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildImage() {
    if (imageFile != null && imageFile!.existsSync()) {
      return Image.file(
        imageFile!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 150,
      );
    } else {
      return Image.asset(
        'assets/images/placeholder.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: 150,
      );
    }
  }
}
