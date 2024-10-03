import 'package:fit/color/colors.dart';
import 'package:fit/db/db_functions.dart';
import 'package:fit/models/category_model.dart';
import 'package:fit/screens/training/workout_screen.dart';
import 'package:fit/widgets/category_template.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        title: const Text(
          'FAVORITES',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: categoryNotifier,
        builder: (context, List<CategoryModel> categories, _) {
          final favoriteCategories =
              categories.where((category) => category.isFavorite).toList();

          if (favoriteCategories.isEmpty) {
            return const Center(child: Text('No favorite categories'));
          }

          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 30),
            itemCount: favoriteCategories.length,
            itemBuilder: (context, index) {
              final category = favoriteCategories[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    await loadWorkouts(category.boxName);
                    Navigator.push(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WorkoutScreen(categoryModel: category)));
                  },
                  child: CategoryCard(
                    category: category,
                    onFavoriteToggle: () {
                      setState(() {
                        category.isFavorite = !category.isFavorite;
                        updateCategory(category, index);
                      });
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
