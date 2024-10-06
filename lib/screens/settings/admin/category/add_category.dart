import 'dart:developer';

import 'package:fit/color/colors.dart';
import 'package:fit/db/db_functions.dart';

import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final _formKey1 = GlobalKey<FormState>();
  String categoryname = '';

  _inputField({
    required String labelText,
    required FormFieldSetter<String> onSaved,
    required FormFieldValidator<String> validator,
    TextInputType inputType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        keyboardType: inputType,
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

  void saveCategoryData() async {
    if (_formKey1.currentState!.validate()) {
      _formKey1.currentState!.save();
      await addCategory(categoryname);
      log('Category saved successfully');
      // ignore: use_build_context_synchronously
      FocusScope.of(context).unfocus();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 300), () {
          Navigator.pop(context);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: _formKey1,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    _inputField(
                      labelText: 'Category',
                      onSaved: (value) => categoryname = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter category name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                )),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colorss.buttonColor,
                ),
                onPressed: saveCategoryData,
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
