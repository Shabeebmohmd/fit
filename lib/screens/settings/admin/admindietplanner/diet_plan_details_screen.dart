import 'package:fit/color/colors.dart';
import 'package:fit/db/diet_functions.dart';
import 'package:fit/models/diet_model.dart';
import 'package:flutter/material.dart';

class DietPlanDetailsPage extends StatefulWidget {
  final DietPlan dietPlan;
  final int index;
  final String category;

  const DietPlanDetailsPage({
    super.key,
    required this.dietPlan,
    required this.index,
    required this.category,
  });

  @override
  State<DietPlanDetailsPage> createState() => _DietPlanDetailsPageState();
}

class _DietPlanDetailsPageState extends State<DietPlanDetailsPage> {
  final _headlineController = TextEditingController();
  final _detailsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _headlineController.text = widget.dietPlan.headline;
    _detailsController.text = widget.dietPlan.details;
  }

  void _editDietPlan() async {
    final updatedPlan = DietPlan(
        headline: _headlineController.text, details: _detailsController.text);

    await editDietPlan(widget.category, widget.index, updatedPlan);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  void _deleteDietPlan() async {
    await deleteDietPlan(widget.category, widget.index);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: AppBar(
        title: Text(widget.dietPlan.headline),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _deleteDietPlan,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _headlineController,
                decoration:
                    const InputDecoration(labelText: 'Headline', filled: true),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _detailsController,
                decoration:
                    const InputDecoration(labelText: 'Details', filled: true),
                maxLines: null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _editDietPlan,
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
