import 'dart:developer';
import 'package:fit/db/db_functions.dart';
import 'package:fit/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:fit/color/colors.dart';

class AddWorkout extends StatefulWidget {
  final CategoryModel category;
  const AddWorkout({super.key, required this.category});

  @override
  State<AddWorkout> createState() => _AddWorkoutState();
}

class _AddWorkoutState extends State<AddWorkout> {
  final _formKey1 = GlobalKey<FormState>();
  String workoutName = '';
  String url = '';
  String description = '';
  double duration = 0.0;

  // Function to save workout data
  void saveWorkoutData() async {
    if (_formKey1.currentState!.validate()) {
      _formKey1.currentState!.save();
      await addWorkout(
          widget.category.boxName, workoutName, url, description, duration);
      await loadWorkouts(widget.category.boxName);
      log('Workout saved successfully for category:');
      // ignore: use_build_context_synchronously
      FocusScope.of(context).unfocus();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 300), () {
          Navigator.pop(context);
        });
      });
    }
  }

  _inputField({
    required String labelText,
    required FormFieldSetter<String> onSaved,
    required FormFieldValidator<String> validator,
    TextInputType inputType = TextInputType.text,
    int? maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        keyboardType: inputType,
        maxLines: maxLines,
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
      backgroundColor: Colorss.backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _inputField(
                        labelText: 'Workout Name',
                        onSaved: (value) => workoutName = value!,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter workout name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      _inputField(
                        labelText: 'URL Link',
                        onSaved: (value) => url = value!,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter URL';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      _inputField(
                          labelText: 'Description',
                          onSaved: (value) => description = value!,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter description';
                            }
                            return null;
                          },
                          inputType: TextInputType.multiline,
                          maxLines: null),
                      const SizedBox(height: 30),
                      _inputField(
                        labelText: 'Duration',
                        onSaved: (value) {
                          try {
                            duration = double.parse(value!);
                          } catch (e) {
                            duration = 0.0;
                            log('Invalid duration input: $value');
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter duration';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Invalid duration format';
                          }
                          return null;
                        },
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(height: 30),
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
                    onPressed: saveWorkoutData,
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
