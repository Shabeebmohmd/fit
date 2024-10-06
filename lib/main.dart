import 'package:fit/db/diet_functions.dart';
import 'package:fit/models/category_model.dart';
import 'package:fit/models/data_models.dart';
import 'package:fit/models/diet_model.dart';
import 'package:fit/models/workout_model.dart';
import 'package:fit/screens/mainscreens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserDataAdapter());
  Hive.registerAdapter(WorkoutModelAdapter());
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(DietPlanAdapter());
  await Hive.openBox<CategoryModel>('category');
  await Hive.openBox<UserData>('userData');
  openHiveBoxesForDiet();
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
