import 'package:fit/color/colors.dart';
import 'package:fit/db/workout_data_handler.dart';
import 'package:fit/models/workout_model.dart';
import 'package:fit/screens/training/beginner/beginner_workout_details.dart';
import 'package:flutter/material.dart';

class Beginner extends StatefulWidget {
  const Beginner({super.key});

  @override
  State<Beginner> createState() => _BeginnerState();
}

class _BeginnerState extends State<Beginner> {
  @override
  void initState() {
    super.initState();
    getAllWorkouts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BEGINNER',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: workoutsNotifier,
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
                              builder: (context) => BeginnerWorkoutDetails(
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
