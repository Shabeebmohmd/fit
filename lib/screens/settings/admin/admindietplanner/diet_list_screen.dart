import 'package:fit/color/colors.dart';
import 'package:fit/db/diet_functions.dart';
import 'package:fit/models/diet_model.dart';
import 'package:fit/screens/settings/admin/admindietplanner/add_diet_plan_screen.dart';
import 'package:fit/screens/settings/admin/admindietplanner/diet_plan_details_screen.dart';
import 'package:fit/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DietPlanListPage extends StatefulWidget {
  final String category;
  const DietPlanListPage({super.key, required this.category});

  @override
  State<DietPlanListPage> createState() => _DietPlanListPageState();
}

class _DietPlanListPageState extends State<DietPlanListPage> {
  @override
  void initState() {
    super.initState();
    getAllDietPlans(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: const CustomAppBar(title: 'Diet Plans'),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<DietPlan>(widget.category).listenable(),
        builder: (context, Box<DietPlan> box, _) {
          if (box.isEmpty) {
            return const Center(child: Text('No diet plans added.'));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final dietPlan = box.getAt(index)!;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.grey[100],
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DietPlanDetailsPage(
                                dietPlan: dietPlan,
                                index: index,
                                category: widget.category)));
                  },
                  title: Text(
                    dietPlan.headline,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () => deleteDietPlan(widget.category, index),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    AddDietPlanPage(category: widget.category)),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
