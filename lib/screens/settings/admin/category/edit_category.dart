import 'package:fit/color/colors.dart';
import 'package:fit/db/db_functions.dart';
import 'package:fit/models/category_model.dart';
import 'package:flutter/material.dart';

class EditCategory extends StatefulWidget {
  final CategoryModel categoryModel;
  final int index;
  const EditCategory(
      {super.key, required this.categoryModel, required this.index});

  @override
  State<EditCategory> createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  late TextEditingController _categoriesController;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _categoriesController =
        TextEditingController(text: widget.categoryModel.categoryName);
  }

  @override
  void dispose() {
    _categoriesController.dispose();
    super.dispose();
  }

  bool _isFormValid() {
    return _categoriesController.text.isNotEmpty;
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _saveCategory() async {
    if (_isFormValid()) {
      final updatedCategory = CategoryModel(
          boxName: widget.categoryModel.boxName,
          categoryName: _categoriesController.text);

      try {
        await updateCategory(updatedCategory, widget.index);
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } catch (e) {
        _showErrorSnackBar('Error saving category: $e');
        debugPrint('Error saving category: $e');
      }
    } else {
      _showErrorSnackBar('Please fill all fields');
    }
  }

  Widget _textField({
    required TextEditingController controller,
    required String labelText,
    required String errorMessage,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMessage;
          }
          return null;
        },
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey,
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.grey[300],
            fontSize: 25,
            fontFamily: 'YanoneKaffeesatz',
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(17),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  child: Column(
                    children: [
                      _textField(
                        controller: _categoriesController,
                        labelText: 'Category Name',
                        errorMessage: 'Please Enter Category name',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colorss.buttonColor,
                    ),
                    onPressed: _saveCategory,
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
