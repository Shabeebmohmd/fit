import 'package:fit/models/workout_model.dart';
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
      appBar: AppBar(
        title: const Text(
          'Workout Info!!',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
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
