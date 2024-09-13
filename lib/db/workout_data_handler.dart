import 'dart:developer';

import 'package:fit/models/workout_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

final ValueNotifier<List<WorkoutModel>> workoutsNotifier = ValueNotifier([]);

Future<void> addWorkoutData(
    String workoutname, String url, String description, double duration) async {
  final box = await Hive.openBox<WorkoutModel>('workoutData');
  var workoutData = WorkoutModel(
      workoutName: workoutname,
      url: url,
      description: description,
      duration: duration);

  await box.add(workoutData);

  // Fetch all workouts to ensure the list is up-to-date
  await getAllWorkouts();
}

Future<void> getAllWorkouts() async {
  final box = await Hive.openBox<WorkoutModel>('workoutData');
  workoutsNotifier.value = box.values.toList();
  workoutsNotifier.notifyListeners();
  log('Get all workout is worked');
}

Future<void> deleteWorkout(int index) async {
  final box = await Hive.openBox<WorkoutModel>('workoutData');
  await box.deleteAt(index);
  await getAllWorkouts();
}

Future<void> editWorkout(int index, WorkoutModel updatedWorkout) async {
  final box = await Hive.openBox<WorkoutModel>('workoutData');
  await box.putAt(index, updatedWorkout);
  await getAllWorkouts();
}
