import 'package:fit/models/data_models.dart';
import 'package:fit/models/workout_model.dart';
import 'package:fit/screens/mainscreens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserDataAdapter());
  Hive.registerAdapter(WorkoutModelAdapter());
  await Hive.openBox<UserData>('userData');
  await Hive.openBox<WorkoutModel>('workoutData');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'fitness',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Splashscreen());
  }
}
