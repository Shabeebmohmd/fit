import 'package:fit/models/diet_model.dart';
import 'package:fit/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class DietPlanDetailsScreen extends StatefulWidget {
  final DietPlan dietPlan;
  final int index;
  final String category;
  const DietPlanDetailsScreen(
      {super.key,
      required this.dietPlan,
      required this.category,
      required this.index});

  @override
  State<DietPlanDetailsScreen> createState() => _DietPlanDetailsScreenState();
}

class _DietPlanDetailsScreenState extends State<DietPlanDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.category,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/diet details.jpeg'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: [
                  TextSpan(
                      text: '${widget.dietPlan.headline} \n\n',
                      style: TextStyle(
                        fontSize: 50,
                      )),
                  TextSpan(
                      text: widget.dietPlan.details,
                      style: TextStyle(fontSize: 17))
                ])),
          ),
        ),
      ),
    );
  }
}
