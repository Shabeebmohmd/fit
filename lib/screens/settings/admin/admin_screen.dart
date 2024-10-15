import 'package:fit/color/colors.dart';
import 'package:fit/db/db_functions.dart';
import 'package:fit/screens/settings/admin/category/admin_categories_screen.dart';
import 'package:fit/screens/settings/admin/admindietplanner/diet_category_screen.dart';
import 'package:fit/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: const CustomAppBar(title: 'ADMIN PANEL'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 220,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategorySelectionPage()));
                },
                color: Colors.teal,
                child: const Text(
                  'DIET PLAN FOR BMI',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            const Divider(),
            SizedBox(
              height: 50,
              width: 220,
              child: MaterialButton(
                onPressed: () async {
                  loadCategories();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdminCategoriesScreen()));
                },
                color: Colors.teal,
                child: const Text(
                  'ADD CATEGORIES',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
