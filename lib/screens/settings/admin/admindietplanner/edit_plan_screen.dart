import 'package:fit/color/colors.dart';
import 'package:fit/db/diet_functions.dart';
import 'package:fit/models/diet_model.dart';
import 'package:flutter/material.dart';

class EditDietPlanScreen extends StatefulWidget {
  final DietPlan dietPlan;
  final int index;
  final String category;

  const EditDietPlanScreen({
    super.key,
    required this.dietPlan,
    required this.index,
    required this.category,
  });

  @override
  State<EditDietPlanScreen> createState() => _EditDietPlanScreenState();
}

class _EditDietPlanScreenState extends State<EditDietPlanScreen> {
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.dietPlan.headline),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _deleteDietPlan,
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/edit diet.jpeg'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                  controller: _headlineController,
                  decoration: InputDecoration(
                    labelText: 'Time eg: Lunch',
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _detailsController,
                  decoration: InputDecoration(
                    labelText: 'Diet plan',
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  maxLines: null,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colorss.buttonColor,
                        foregroundColor: Colors.white),
                    onPressed: _editDietPlan,
                    child: const Text(
                      'Save Changes',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
