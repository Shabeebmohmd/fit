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
                      text: '${widget.model.headline} \n\n',
                      style: TextStyle(
                        fontSize: 50,
                      )),
                  TextSpan(
                      text: widget.model.details,
                      style: TextStyle(fontSize: 17))
                ])),
          ),
        ),
      ),
    );
  }
}
