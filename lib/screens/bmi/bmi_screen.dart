import 'package:fit/screens/bmi/diet_plan_screen.dart';
import 'package:fit/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class Bmiscreen extends StatefulWidget {
  const Bmiscreen({super.key});

  @override
  State<Bmiscreen> createState() => _BmiscreenState();
}

class _BmiscreenState extends State<Bmiscreen> {
  final _heightcontroller = TextEditingController();
  final _weightcontroller = TextEditingController();

  double _bmi = 0.0;
  String _bmiCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 205, 235),
      appBar: const CustomAppBar(title: 'BMI CALCULATOR'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  height(),
                  const SizedBox(
                    width: 15,
                  ),
                  weight(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: calculatebutton(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: 330,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _heightcontroller.text = '';
                          _weightcontroller.text = '';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17)),
                          foregroundColor: Colors.white),
                      child: const Text(
                        'Recalculate BMI',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: result(),
              ),
              const SizedBox(height: 20),
              _dietPlanButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Container result() {
    return Container(
      width: 330,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _bmi > 0
                  ? "Your BMI is ${_bmi.toStringAsFixed(2)}"
                  : "Enter values to calculate BMI",
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              _bmiCategory,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _getCategoryColor(_bmiCategory)),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox calculatebutton() {
    return SizedBox(
      width: 330,
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              _calculateBMI();
            });
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17)),
              foregroundColor: Colors.white),
          child: const Text(
            'Calculate BMI',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
    );
  }

  void _calculateBMI() {
    final double height = double.tryParse(_heightcontroller.text) ?? 0;
    final double weight = double.tryParse(_weightcontroller.text) ?? 0;
    double heightcm = height / 100;
    if (heightcm > 0 && weight > 0) {
      _bmi = weight / (heightcm * heightcm);

      if (_bmi < 18.5) {
        _bmiCategory = 'Underweight';
      } else if (_bmi >= 18.5 && _bmi <= 24.9) {
        _bmiCategory = 'Normal';
      } else if (_bmi >= 25.0 && _bmi <= 39.9) {
        _bmiCategory = 'Overweight';
      } else if (_bmi >= 40.0) {
        _bmiCategory = 'Obese';
      }
    } else {
      _bmi = 0;
      _bmiCategory = '';
    }
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

  Container weight() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: Colors.white,
      ),
      width: 159,
      height: 159,
      child: Column(
        children: [
          const Text(
            'Weight (kg)',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _weightcontroller,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              decoration: const InputDecoration(),
            ),
          ),
        ],
      ),
    );
  }

  Container height() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: Colors.white,
      ),
      width: 159,
      height: 159,
      child: Column(
        children: [
          const Text(
            'Height (cm)',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: _heightcontroller,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _dietPlanButton(BuildContext context) {
    return SizedBox(
      width: 330,
      height: 50,
      child: ElevatedButton(
        onPressed: _bmiCategory.isNotEmpty
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DietPlanScreen(bmicategory: _bmiCategory)),
                );
              }
            : null,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            foregroundColor: Colors.white),
        child: const Text(
          'View Diet Plan',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
