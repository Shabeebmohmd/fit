import 'package:fit/color/colors.dart';
import 'package:fit/db/db_functions.dart';
import 'package:fit/models/category_model.dart';
import 'package:fit/screens/training/workout_screen.dart';
import 'package:fit/widgets/category_template.dart';
import 'package:fit/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late TextEditingController _searchController;
  List<CategoryModel> _filteredCategories = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
    loadCategories();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void loadCategories() {
    _filteredCategories = categoryNotifier.value;
  }

  void _onSearchChanged() {
    setState(() {
      _filteredCategories = categoryNotifier.value
          .where((category) => category.categoryName
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  void toggleFavorite(CategoryModel category, int index) {
    setState(() {
      category.isFavorite = !category.isFavorite;
      updateCategory(category, index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: const CustomAppBar(title: 'WORKOUTS'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // For wide screens (web/tablet)
          if (constraints.maxWidth > 600) {
            return _buildWideLayout(context);
          }
          // For small screens (mobile)
          else {
            return _buildMobileLayout(context);
          }
        },
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        // Search TextField
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search Categories',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[300],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: categoryNotifier,
            builder: (context, List<CategoryModel> categories, _) {
              if (_filteredCategories.isEmpty) {
                return const Center(
                  child: Text('No workout found'),
                );
              } else {
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 30,
                  ),
                  itemCount: _filteredCategories.length,
                  itemBuilder: (context, index) {
                    final category = _filteredCategories[index];
                    return InkWell(
                      onTap: () async {
                        await loadWorkouts(category.boxName);
                        Navigator.push(
                          // ignore: use_build_context_synchronously
                          context,
                          MaterialPageRoute(
                            builder: (context) => WorkoutScreen(
                              categoryModel: category,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CategoryCard(
                          category: category,
                          onFavoriteToggle: () =>
                              toggleFavorite(category, index),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Column(
      children: [
        // Search TextField
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search Categories',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[300],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: categoryNotifier,
            builder: (context, List<CategoryModel> categories, _) {
              if (_filteredCategories.isEmpty) {
                return const Center(
                  child: Text('No workout found'),
                );
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        3, // Display 3 items per row on wide screens
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.5, // Adjust item aspect ratio
                  ),
                  padding: const EdgeInsets.all(32.0),
                  itemCount: _filteredCategories.length,
                  itemBuilder: (context, index) {
                    final category = _filteredCategories[index];
                    return InkWell(
                      onTap: () async {
                        await loadWorkouts(category.boxName);
                        Navigator.push(
                          // ignore: use_build_context_synchronously
                          context,
                          MaterialPageRoute(
                            builder: (context) => WorkoutScreen(
                              categoryModel: category,
                            ),
                          ),
                        );
                      },
                      child: CategoryCard(
                        category: category,
                        onFavoriteToggle: () => toggleFavorite(category, index),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
