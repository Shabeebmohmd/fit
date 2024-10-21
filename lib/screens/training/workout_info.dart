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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/workout info.jpeg'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.model.description,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
