import 'package:fit/color/colors.dart';
import 'package:fit/db/db_functions.dart';
import 'package:fit/models/category_model.dart';
import 'package:fit/models/workout_model.dart';
import 'package:fit/screens/training/break_time_screen.dart';
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

  void _startWorkoutSequenceWithInitialBreak(
      List<WorkoutModel> workouts) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BreakScreen(
          initialBreakDuration: 15,
          onBreakComplete: () => Navigator.pop(context),
          onSkipBreak: () => Navigator.pop(context),
        ),
      ),
    );
    _startWorkoutSequence(workouts);
  }

  void _startWorkoutSequence(List<WorkoutModel> workouts) async {
    for (int i = 0; i < workouts.length; i++) {
      final currentWorkout = workouts[i];

      await Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => WorkoutDetails(
            workoutIndex: i,
            model: currentWorkout,
            workouts: workouts,
          ),
        ),
      );

      if (i < workouts.length - 1) {
        await Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => BreakScreen(
              initialBreakDuration: 15,
              onBreakComplete: () => Navigator.pop(context),
              onSkipBreak: () => Navigator.pop(context),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ValueListenableBuilder<List<WorkoutModel>>(
        valueListenable: workoutNotifiers[widget.categoryModel.boxName]!,
        builder: (context, List<WorkoutModel> workout, _) {
          return SizedBox(
            height: 60,
            width: 350,
            child: FloatingActionButton.extended(
              backgroundColor: Colorss.buttonColor,
              foregroundColor: Colors.white,
              onPressed: workout.isNotEmpty
                  ? () {
                      _startWorkoutSequenceWithInitialBreak(workout);
                    }
                  : null,
              label: const Text(
                'Start',
                style: TextStyle(fontSize: 25),
              ),
            ),
          );
        },
      ),
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
                    _startWorkoutSequence(workout);
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
        },
      ),
    );
  }
}
