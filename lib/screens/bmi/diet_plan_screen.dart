import 'package:fit/color/colors.dart';
import 'package:fit/models/diet_model.dart';
import 'package:fit/screens/bmi/diet_plan_more_details_screen.dart';
import 'package:fit/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DietPlanScreen extends StatefulWidget {
  final String bmicategory;
  const DietPlanScreen({super.key, required this.bmicategory});

  @override
  State<DietPlanScreen> createState() => _DietPlanScreenState();
}

class _DietPlanScreenState extends State<DietPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: CustomAppBar(title: widget.bmicategory),
      body: ValueListenableBuilder(
          valueListenable: Hive.box<DietPlan>(widget.bmicategory).listenable(),
          builder: (context, Box<DietPlan> box, _) {
            if (box.isEmpty) {
              return const Center(child: Text('Diet plan not added'));
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
                              builder: (context) => DietPlanMoreDetailsScreen(
                                  model: dietPlan,
                                  bmicategory: widget.bmicategory)));
                    },
                    title: Center(
                      child: Text(
                        dietPlan.headline,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
