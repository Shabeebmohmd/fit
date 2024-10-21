import 'dart:developer';

import 'package:fit/color/colors.dart';
import 'package:fit/db/diet_functions.dart';
import 'package:flutter/material.dart';

class AddDietPlanPage extends StatefulWidget {
  final String category;

  const AddDietPlanPage({super.key, required this.category});

  @override
  State<AddDietPlanPage> createState() => _AddDietPlanPageState();
}

class _AddDietPlanPageState extends State<AddDietPlanPage> {
  final _formKey1 = GlobalKey<FormState>();
  String headline = '';
  String dietplan = '';

  void saveWorkoutDietPlan() async {
    if (_formKey1.currentState!.validate()) {
      _formKey1.currentState!.save();
      await addDietPlan(widget.category, headline, dietplan);
      //  getAllDietPlans(widget.category);
      log('Diet saved successfully for category:');
      // ignore: use_build_context_synchronously
      FocusScope.of(context).unfocus();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 300), () {
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(widget.category)),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/add diet.jpeg'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Form(
                    key: _formKey1,
                    child: Column(
                      children: [
                        TextFormField(
                          onSaved: (value) => headline = value!,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter a time';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[100],
                            labelText: 'Time. eg: Lunch',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(17),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          onSaved: (value) => dietplan = value!,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter diet plan';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[100],
                            labelText: 'Diet plan',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(17),
                            ),
                          ),
                          maxLines: null,
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colorss.buttonColor,
                                foregroundColor: Colors.white),
                            onPressed: saveWorkoutDietPlan,
                            child: const Text(
                              'Save',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
