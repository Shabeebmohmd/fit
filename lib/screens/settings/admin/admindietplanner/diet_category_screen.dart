import 'package:fit/color/colors.dart';
import 'package:fit/screens/settings/admin/admindietplanner/diet_list_screen.dart';
import 'package:fit/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class CategorySelectionPage extends StatelessWidget {
  const CategorySelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: const CustomAppBar(title: 'SELECT CATEGORY'),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/select category.jpeg'),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  tileColor: Colors.blue,
                  textColor: Colors.white,
                  title: const Center(
                    child: Text(
                      'Underweight',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const DietPlanListPage(category: 'Underweight'),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  tileColor: Colors.green,
                  textColor: Colors.white,
                  title: const Center(
                      child: Text(
                    'Normal',
                    style: TextStyle(fontSize: 20),
                  )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const DietPlanListPage(category: 'Normal'),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  tileColor: Colors.orange,
                  textColor: Colors.white,
                  title: const Center(
                      child:
                          Text('Overweight', style: TextStyle(fontSize: 20))),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const DietPlanListPage(category: 'Overweight'),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  tileColor: Colors.red,
                  textColor: Colors.white,
                  title: const Center(
                      child: Text('Obese', style: TextStyle(fontSize: 20))),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const DietPlanListPage(category: 'Obese'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
