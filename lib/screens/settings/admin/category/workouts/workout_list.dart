import 'package:fit/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fit/color/colors.dart';
import 'package:fit/db/db_functions.dart';
import 'package:fit/models/category_model.dart';
import 'package:fit/models/workout_model.dart';
import 'package:fit/screens/settings/admin/category/workouts/add_workout.dart';
import 'package:fit/screens/settings/admin/category/workouts/workout_details.dart';
import 'package:fit/screens/settings/admin/category/workouts/workout_edit.dart';

class WorkoutList extends StatefulWidget {
  final CategoryModel category;

  const WorkoutList({
    super.key,
    required this.category,
  });

  @override
  State<WorkoutList> createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  @override
  void initState() {
    super.initState();
    loadWorkouts(widget.category.boxName);
  }

  @override
  Widget build(BuildContext context) {
    final workoutNotifier = workoutNotifiers[widget.category.boxName];

    if (workoutNotifier == null) {
      return Scaffold(
        appBar: CustomAppBar(title: widget.category.categoryName),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddWorkout(category: widget.category)),
          );
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colorss.backgroundColor,
      appBar: CustomAppBar(title: widget.category.categoryName),
      body: ValueListenableBuilder<List<WorkoutModel>>(
        valueListenable: workoutNotifier,
        builder: (context, List<WorkoutModel> workouts, _) {
          if (workouts.isEmpty) {
            return const Center(
              child: Text(
                'Press add button to add workout',
                style: TextStyle(fontSize: 17),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: workouts.length,
                itemBuilder: (context, index) {
                  var workout = workouts[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutDetails(
                            workoutIndex: index,
                            model: workout,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(
                          workout.workoutName,
                          style: const TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20),
                        ),
                        subtitle: Text('${workout.duration} sec'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WorkoutEdit(
                                                workoutIndex: index,
                                                categoryModel: widget.category,
                                                workoutModel: workout,
                                              )));
                                },
                                icon: const Icon(
                                  Icons.edit_square,
                                  color: Colorss.buttonColor,
                                )),
                            IconButton(
                                onPressed: () async {
                                  deleteWorkout(
                                      widget.category.boxName, workout);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
