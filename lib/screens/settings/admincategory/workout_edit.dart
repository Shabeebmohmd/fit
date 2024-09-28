import 'package:fit/color/colors.dart';
import 'package:fit/db/db_functions.dart';
import 'package:fit/models/category_model.dart';
import 'package:fit/models/workout_model.dart';
import 'package:flutter/material.dart';

class WorkoutEdit extends StatefulWidget {
  final int workoutIndex;
  final CategoryModel categoryModel;
  final WorkoutModel workoutModel;

  const WorkoutEdit({
    super.key,
    required this.workoutIndex,
    required this.categoryModel,
    required this.workoutModel,
  });

  @override
  State<WorkoutEdit> createState() => _WorkoutEditState();
}

class _WorkoutEditState extends State<WorkoutEdit> {
  late TextEditingController _workoutNameController;
  late TextEditingController _urlController;
  late TextEditingController _descriptionController;
  late TextEditingController _durationController;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _workoutNameController =
        TextEditingController(text: widget.workoutModel.workoutName);
    _urlController = TextEditingController(text: widget.workoutModel.url);
    _descriptionController =
        TextEditingController(text: widget.workoutModel.description);
    _durationController =
        TextEditingController(text: widget.workoutModel.duration.toString());
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _disposeControllers() {
    _workoutNameController.dispose();
    _urlController.dispose();
    _descriptionController.dispose();
    _durationController.dispose();
  }

  Future<void> _saveWorkout() async {
    if (_isFormValid()) {
      final updatedWorkout = WorkoutModel(
        workoutName: _workoutNameController.text,
        url: _urlController.text,
        description: _descriptionController.text,
        duration: double.tryParse(_durationController.text) ?? 0.0,
      );

      await updateWorkout(
          widget.categoryModel.boxName, widget.workoutIndex, updatedWorkout);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } else {
      _showErrorSnackBar('Please fill all fields');
    }
  }

  bool _isFormValid() {
    return _workoutNameController.text.isNotEmpty &&
        _urlController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _durationController.text.isNotEmpty;
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
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
      backgroundColor: Colorss.backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  child: Column(
                    children: [
                      _textField(
                        controller: _workoutNameController,
                        labelText: 'Workout name',
                        errorMessage: 'Please enter workout name',
                      ),
                      const SizedBox(height: 30),
                      _textField(
                        controller: _urlController,
                        labelText: 'URL Link',
                        errorMessage: 'Please enter URL',
                      ),
                      const SizedBox(height: 30),
                      _textField(
                        controller: _descriptionController,
                        labelText: 'Description',
                        errorMessage: 'Please enter description',
                      ),
                      const SizedBox(height: 30),
                      _textField(
                        controller: _durationController,
                        labelText: 'Duration',
                        errorMessage: 'Please enter duration',
                        keyboardType: TextInputType.number,
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
                    onPressed: _saveWorkout,
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
