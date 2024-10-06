import 'package:fit/models/workout_model.dart';
import 'package:fit/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class WorkoutInfo extends StatefulWidget {
  final WorkoutModel model;
  const WorkoutInfo({super.key, required this.model});

  @override
  State<WorkoutInfo> createState() => _WorkoutInfoState();
}

class _WorkoutInfoState extends State<WorkoutInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colorss.backgroundColor,
      appBar: const CustomAppBar(title: 'Workout Info!!'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Text(
              widget.model.description,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
