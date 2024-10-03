import 'package:fit/color/colors.dart';
import 'package:fit/db/db_functions.dart';
import 'package:fit/models/category_model.dart';
import 'package:fit/screens/settings/admincategory/add_category.dart';
import 'package:fit/screens/settings/admincategory/workout_list.dart';
import 'package:fit/widgets/category_admin_template.dart';
import 'package:fit/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class AdminCategoriesScreen extends StatefulWidget {
  const AdminCategoriesScreen({super.key});

  @override
  State<AdminCategoriesScreen> createState() => _AdminCategoriesScreenState();
}

class _AdminCategoriesScreenState extends State<AdminCategoriesScreen> {
  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: const CustomAppBar(title: 'ADMIN PANEL'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddCategory()));
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder<List<CategoryModel>>(
            valueListenable: categoryNotifier,
            builder: (context, List<CategoryModel> categories, _) {
              if (categories.isEmpty) {
                return const Center(
                  child: Text('Add category'),
                );
              } else {
                return ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 30,
                        ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      var ctgry = categories[index];
                      return InkWell(
                          onTap: () async {
                            await loadWorkouts(ctgry.boxName);
                            Navigator.push(
                                // ignore: use_build_context_synchronously
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WorkoutList(category: ctgry)));
                          },
                          onLongPress: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: const Text("'DELETE!'"),
                                      content: const Text(
                                          'Are you sure you want to Delete'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 20),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              deleteCategory(ctgry);
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              'Confirm',
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 20),
                                            ))
                                      ]);
                                });
                          },
                          child: CategoryAdminCard(
                            categoryname: ctgry.categoryName,
                            categoryModel: ctgry,
                            index: index,
                          ));
                    });
              }
            }),
      ),
    );
  }
}
