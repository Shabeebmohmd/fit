import 'dart:developer';

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
      log('Workout saved successfully for category:');
      // ignore: use_build_context_synchronously
      FocusScope.of(context).unfocus();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 300), () {
          Navigator.pop(context);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Diet Plan for ${widget.category}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                            return 'Enter a headline';
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(labelText: 'Headline'),
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
                        decoration: const InputDecoration(labelText: 'Details'),
                        maxLines: null,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: saveWorkoutDietPlan,
                        child: const Text('Add Diet Plan'),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
