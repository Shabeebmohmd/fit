import 'package:fit/color/colors.dart';
import 'package:fit/db/db_functions.dart';
import 'package:fit/models/category_model.dart';
import 'package:fit/models/workout_model.dart';
import 'package:fit/screens/training/workout_details.dart';
import 'package:fit/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class WorkoutScreen extends StatefulWidget {
  final CategoryModel categoryModel;
  const WorkoutScreen({super.key, required this.categoryModel});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  void initState() {
    super.initState();
    loadWorkouts(widget.categoryModel.boxName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: CustomAppBar(title: widget.categoryModel.categoryName),
      body: ValueListenableBuilder<List<WorkoutModel>>(
          valueListenable: workoutNotifiers[widget.categoryModel.boxName]!,
          builder: (context, List<WorkoutModel> workout, _) {
            if (workout.isEmpty) {
              return const Center(
                child: Text('No workout'),
              );
            } else {
              return ListView.separated(
                itemCount: workout.length,
                itemBuilder: (context, index) {
                  final workouts = workout[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkoutDetails(
                                    workoutIndex: index,
                                    model: workouts,
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          leading: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Image.asset('assets/images/tile.jpeg')),
                          title: Text(
                            workouts.workoutName,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          subtitle: Text('${workouts.duration}s'),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              );
            }
          }),
    );
  }
}
