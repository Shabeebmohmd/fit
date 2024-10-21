import 'package:fit/color/colors.dart';
import 'package:fit/db/diet_functions.dart';
import 'package:fit/models/diet_model.dart';
import 'package:fit/screens/settings/admin/admindietplanner/add_diet_plan_screen.dart';
import 'package:fit/screens/settings/admin/admindietplanner/diet_plan_details_screen.dart';
import 'package:fit/screens/settings/admin/admindietplanner/edit_plan_screen.dart';
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
      appBar: CustomAppBar(title: widget.category),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/diet list.jpeg'),
                fit: BoxFit.cover)),
        child: ValueListenableBuilder(
          valueListenable: Hive.box<DietPlan>(widget.category).listenable(),
          builder: (context, Box<DietPlan> box, _) {
            if (box.isEmpty) {
              return const Center(
                  child: Text(
                'Press add button below to add diet',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ));
            }

            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                final dietPlan = box.getAt(index)!;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      tileColor: Colors.grey[100],
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DietPlanDetailsScreen(
                                      category: widget.category,
                                      dietPlan: dietPlan,
                                      index: index,
                                    )));
                      },
                      title: Text(
                        dietPlan.headline,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditDietPlanScreen(
                                                dietPlan: dietPlan,
                                                index: index,
                                                category: widget.category)));
                              },
                              icon: Icon(
                                Icons.edit_square,
                                color: Colors.amber,
                              )),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () => showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: const Text("Delete!"),
                                      content: const Text('Are you sure ?'),
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
                                              deleteDietPlan(
                                                  widget.category, index);
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Confirm',
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 20),
                                            ))
                                      ]);
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
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
