import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fit/color/colors.dart';
import 'package:fit/db/workout_data_handler.dart';

class BeginnerAdd extends StatefulWidget {
  const BeginnerAdd({super.key});

  @override
  State<BeginnerAdd> createState() => _BeginnerAddState();
}

class _BeginnerAddState extends State<BeginnerAdd> {
  final _formKey1 = GlobalKey<FormState>();

  String workoutName = '';
  String url = '';
  String description = '';
  double duration = 0.0;

  // Function to save workout data
  void saveWorkoutData() async {
    if (_formKey1.currentState!.validate()) {
      _formKey1.currentState!.save();
      await addWorkoutData(workoutName, url, description, duration);
      log('Workout saved successfully');
      getAllWorkouts();

      FocusScope.of(context).unfocus(); // Unfocus the keyboard
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
                    ),
                    const SizedBox(height: 30),
                    _inputField(
                      labelText: 'Duration',
                      onSaved: (value) => duration = double.parse(value!),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter duration';
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
    );
  }
}
