import 'dart:developer';

import 'package:fit/models/category_model.dart';
import 'package:fit/models/workout_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<CategoryModel>> categoryNotifier = ValueNotifier([]);
Map<String, ValueNotifier<List<WorkoutModel>>> workoutNotifiers = {};

Future<void> addCategory(String categoryName) async {
  var categoryBox = Hive.box<CategoryModel>('category');
  String boxName =
      '${categoryName.toLowerCase().replaceAll(' ', '_')}_workouts';
  var newCategory = CategoryModel(categoryName: categoryName, boxName: boxName);

  await categoryBox.add(newCategory);
  categoryNotifier.value = categoryBox.values.toList();

  // Open a new box for workouts
  await Hive.openBox<WorkoutModel>(boxName);
  workoutNotifiers[boxName] = ValueNotifier([]);
}

Future<void> addWorkout(String boxName, String workoutName, String url,
    String description, double duration) async {
  final workoutBox = await Hive.openBox<WorkoutModel>(boxName);
  var newWorkout = WorkoutModel(
    workoutName: workoutName,
    url: url,
    description: description,
    duration: duration,
  );

  await workoutBox.add(newWorkout);
  workoutNotifiers[boxName]?.value = List<WorkoutModel>.from(workoutBox.values);
}

Future<void> deleteCategory(CategoryModel category) async {
  var categoryBox = Hive.box<CategoryModel>('category');

  // Delete the workout box associated with this category
  await Hive.deleteBoxFromDisk(category.boxName);

  // Find the key of the category in the box and delete it
  int? keyToDelete;
  for (var entry in categoryBox.toMap().entries) {
    if (entry.value == category) {
      keyToDelete = entry.key;
      break;
    }
  }

  if (keyToDelete != null) {
    await categoryBox.delete(keyToDelete);
  }

  // Update the category list in the UI
  categoryNotifier.value = categoryBox.values.toList();
}

Future<void> deleteWorkout(String boxName, WorkoutModel workout) async {
  var workoutBox = Hive.box<WorkoutModel>(boxName);

  // Find the key of the workout to delete
  int? keyToDelete;
  for (var entry in workoutBox.toMap().entries) {
    if (entry.value == workout) {
      keyToDelete = entry.key;
      break;
    }
  }

  if (keyToDelete != null) {
    await workoutBox.delete(keyToDelete);
  }

  workoutNotifiers[boxName]?.value = workoutBox.values.toList();
}

Future<void> loadCategories() async {
  var categoryBox = Hive.box<CategoryModel>('category');
  categoryNotifier.value = categoryBox.values.toList();
}

Future<void> loadWorkouts(String boxName) async {
  // Open the Hive box for the workout models if not already opened
  if (!Hive.isBoxOpen(boxName)) {
    await Hive.openBox<WorkoutModel>(boxName);
  }

  final workoutBox = Hive.box<WorkoutModel>(boxName);

  // Check if workoutNotifiers[boxName] is null and initialize if needed
  if (workoutNotifiers[boxName] == null) {
    workoutNotifiers[boxName] = ValueNotifier<List<WorkoutModel>>([]);
  }

  // Immediately update the workouts list
  workoutNotifiers[boxName]?.value = List<WorkoutModel>.from(workoutBox.values);

  log('Loaded workouts for $boxName');
}

Future<void> updateCategory(CategoryModel updatedCategory, int index) async {
  final categorybox = Hive.box<CategoryModel>('category');
  await categorybox.putAt(index, updatedCategory);
  categoryNotifier.value = categorybox.values.toList();
}

Future<void> updateWorkout(
    String boxName, int index, WorkoutModel updatedWorkout) async {
  final workoutBox = await Hive.openBox<WorkoutModel>(boxName);
  await workoutBox.putAt(index, updatedWorkout);
  workoutNotifiers[boxName]?.value = workoutBox.values.toList();
}
