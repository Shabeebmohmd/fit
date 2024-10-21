import 'package:fit/db/bmi_functions.dart';
import 'package:fit/models/bmi_model.dart';
import 'package:fit/screens/bmi/diet_plan_screen.dart';
import 'package:fit/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class BmiHistroyScreen extends StatelessWidget {
  const BmiHistroyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colorss.backgroundColor,
      appBar: CustomAppBar(title: 'BMI HISTROY'),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/edit diet.jpeg'),
                fit: BoxFit.cover)),
        child: ValueListenableBuilder<List<BmiModel>>(
            valueListenable: bmiNotifier,
            builder: (context, List<BmiModel> bmi, _) {
              if (bmi.isEmpty) {
                return const Center(child: Text('No history found'));
              } else {
                return ListView.builder(
                    itemCount: bmi.length,
                    itemBuilder: (context, index) {
                      final bmiEntry = bmi[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DietPlanScreen(
                                        bmicategory: bmiEntry.bmiCategory))),
                            textColor: Colors.white,
                            onLongPress: () => _showAlertDialog(context, index),
                            tileColor: _getCategoryColor(bmiEntry.bmiCategory),
                            leading: Text(
                              bmiEntry.bmiValue.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            trailing: Text(
                              bmiEntry.bmiCategory,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          ),
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }

  void _showAlertDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete!'),
          content: Text('Are sure you want to delete'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                deleteBmi(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Underweight':
        return Colors.blue;
      case 'Normal':
        return Colors.green;
      case 'Overweight':
        return Colors.orange;
      case 'Obese':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
