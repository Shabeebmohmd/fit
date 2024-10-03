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

  /// Start the workout sequence, starting with an optional initial break.
  void _startWorkoutSequenceWithInitialBreak(
      List<WorkoutModel> workouts) async {
    // Start with a break time before the first workout.
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BreakScreen(
          initialBreakDuration: 15, // Pre-workout break of 15 seconds
          onBreakComplete: () => Navigator.pop(context),
          onSkipBreak: () => Navigator.pop(context),
        ),
      ),
    );

    // After the initial break, start the workout sequence
    _startWorkoutSequence(workouts);
  }

  /// Start the workout sequence without an initial break.
  void _startWorkoutSequence(List<WorkoutModel> workouts) async {
    for (int i = 0; i < workouts.length; i++) {
      final currentWorkout = workouts[i];

      // Navigate to the workout details screen
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

      // If it's not the last workout, show the break screen
      if (i < workouts.length - 1) {
        await Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => BreakScreen(
              initialBreakDuration: 15, // Break between workouts
              onBreakComplete: () =>
                  Navigator.pop(context), // Close when break ends
              onSkipBreak: () => Navigator.pop(context), // Skip break
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
                      // Start the workout sequence when the button is pressed
                      _startWorkoutSequenceWithInitialBreak(workout);
                    }
                  : null, // Disable button if no workouts
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
                    _startWorkoutSequence(
                        workout); // Optionally allow starting from a workout tap
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
