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
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategorySelectionPage()));
              },
              child: Container(
                  width: double.infinity,
                  height: 170,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(17)),
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(17),
                          child: Image.asset(
                            'assets/images/Banana Oatmeal.jpeg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 150,
                          )),
                      Positioned(
                          bottom: 25,
                          right: 20,
                          child: Container(
                            height: 35,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(7)),
                            child: Center(
                                child: Text(
                              'Add diet plan',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                          ))
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: InkWell(
              onTap: () async {
                await loadCategories();
                Navigator.push(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdminCategoriesScreen()));
              },
              child: Container(
                  width: double.infinity,
                  height: 170,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(17)),
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(17),
                          child: Image.asset(
                            'assets/images/category.jpeg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 150,
                          )),
                      Positioned(
                          bottom: 25,
                          right: 20,
                          child: Container(
                            height: 35,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(7)),
                            child: Center(
                                child: Text(
                              'Add categories',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                          ))
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
