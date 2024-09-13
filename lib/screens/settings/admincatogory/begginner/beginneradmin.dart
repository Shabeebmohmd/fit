import 'package:fit/color/colors.dart';
import 'package:fit/db/workout_data_handler.dart';
import 'package:fit/models/workout_model.dart';
import 'package:fit/screens/settings/admincatogory/begginner/beginner_add.dart';
import 'package:fit/screens/settings/admincatogory/begginner/beginner_details.dart';
import 'package:fit/screens/settings/admincatogory/begginner/beginner_edit.dart';
import 'package:flutter/material.dart';

class Beginneradmin extends StatefulWidget {
  const Beginneradmin({super.key});

  @override
  State<Beginneradmin> createState() => _BeginneradminState();
}

class _BeginneradminState extends State<Beginneradmin> {
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
        title: const Text(
          'BEGINNER',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ValueListenableBuilder<List<WorkoutModel>>(
          valueListenable: workoutsNotifier,
          builder: (context, List<WorkoutModel> workouts, _) {
            if (workouts.isEmpty) {
              return const Center(
                child: Text('Add workout'),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: workouts.length,
                    itemBuilder: (context, index) {
                      final workout = workouts[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BeginnerDetails(
                                        workoutIndex: index,
                                        model: workout,
                                      )));
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(
                              workout.workoutName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 20),
                            ),
                            subtitle: Text('${workout.duration}min'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BeginnerEdit(
                                                      workoutIndex: index,
                                                      workout: workout)));
                                    },
                                    icon: const Icon(
                                      Icons.edit_square,
                                      color: Colors.amber,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      deleteWorkout(index);
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
                    }),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const BeginnerAdd()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
