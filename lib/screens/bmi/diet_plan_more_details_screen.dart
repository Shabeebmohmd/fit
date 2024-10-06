import 'package:fit/color/colors.dart';
import 'package:fit/models/diet_model.dart';
import 'package:fit/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class DietPlanMoreDetailsScreen extends StatefulWidget {
  final DietPlan model;
  final String bmicategory;
  const DietPlanMoreDetailsScreen(
      {super.key, required this.model, required this.bmicategory});

  @override
  State<DietPlanMoreDetailsScreen> createState() =>
      _DietPlanMoreDetailsScreenState();
}

class _DietPlanMoreDetailsScreenState extends State<DietPlanMoreDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: CustomAppBar(title: widget.bmicategory),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: ListTile(
                title: Text(
                  widget.model.headline,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                title: Text(
                  widget.model.details,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
