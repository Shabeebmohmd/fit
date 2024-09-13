import 'package:hive_flutter/hive_flutter.dart';
part 'workout_model.g.dart';

@HiveType(typeId: 1)
class WorkoutModel {
  @HiveField(0)
  String workoutName;

  @HiveField(1)
  String? url;

  @HiveField(2)
  String description;

  @HiveField(3)
  double duration;

  WorkoutModel({
    required this.workoutName,
    this.url,
    required this.description,
    required this.duration,
  });
}
