import 'package:fit/db/user_data_handler.dart';
import 'package:flutter/material.dart';
import 'package:fit/screens/mainscreens/home_screen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  int age = 0;
  double height = 0.0;
  double weight = 0.0;

  void saveUserData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await addUserData(name, age, height, weight);
      FocusScope.of(context).unfocus();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Homescreen()));
      });
    }
  }

  _inputField({
    required String label,
    required String? Function(String?) validator,
    required void Function(String?) onSaved,
    required TextInputType keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        keyboardType: keyboardType,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey,
          labelText: label,
          labelStyle: TextStyle(
              color: Colors.grey[300],
              fontSize: 25,
              fontFamily: 'YanoneKaffeesatz'),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(17),
          ),
        ),
      ),
    );
  }

  _submitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "let's go",
          style: TextStyle(
              fontSize: 30,
              fontFamily: 'YanoneKaffeesatz',
              color: Colors.white),
        ),
        const SizedBox(width: 5),
        IconButton(
          onPressed: saveUserData,
          icon: const Icon(
            Icons.arrow_circle_right_rounded,
            color: Colors.white,
            size: 50,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/onboard.jpg'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _inputField(
                    label: 'Enter your name',
                    keyboardType: TextInputType.text,
                    onSaved: (value) => name = value!,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  _inputField(
                    label: 'Enter your age',
                    keyboardType: TextInputType.number,
                    onSaved: (value) => age = int.parse(value!),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  _inputField(
                    label: 'Enter your height',
                    keyboardType: TextInputType.number,
                    onSaved: (value) => height = double.parse(value!),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your height';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  _inputField(
                    label: 'Enter your weight',
                    keyboardType: TextInputType.number,
                    onSaved: (value) => weight = double.parse(value!),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your weight';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  _submitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
