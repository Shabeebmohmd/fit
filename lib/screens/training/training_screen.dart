import 'package:fit/color/colors.dart';
import 'package:fit/db/db_functions.dart';
import 'package:fit/models/category_model.dart';
import 'package:fit/screens/training/workout_screen.dart';
import 'package:fit/widgets/category_template.dart';
import 'package:fit/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: const CustomAppBar(title: 'WORKOUTS'),
      body: ValueListenableBuilder(
          valueListenable: categoryNotifier,
          builder: (context, List<CategoryModel> categories, _) {
            if (categories.isEmpty) {
              return const Center(
                child: Text('No workout'),
              );
            } else {
              return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 30,
                      ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final ctgry = categories[index];
                    return InkWell(
                      onTap: () async {
                        await loadWorkouts(ctgry.boxName);
                        Navigator.push(
                            // ignore: use_build_context_synchronously
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    WorkoutScreen(categoryModel: ctgry)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CategoryCard(categoryname: ctgry.categoryName),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
