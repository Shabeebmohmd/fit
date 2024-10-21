import 'package:fit/color/colors.dart';
import 'package:fit/db/user_data_handler.dart';
import 'package:fit/models/data_models.dart';
import 'package:flutter/material.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  UserData? user;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  void _getUser() async {
    user = await getUserData();
    if (user != null) {
      _nameController.text = user!.name;
      _ageController.text = user!.age.toString();
      _heightController.text = user!.height.toString();
      _weightController.text = user!.weight.toString();
    }
  }

  void _clearFields() {
    setState(() {
      _nameController.clear();
      _ageController.clear();
      _heightController.clear();
      _weightController.clear();
    });
  }

  void _saveData() {
    if (_formKey.currentState!.validate()) {
      try {
        final name = _nameController.text;
        final age = int.parse(_ageController.text);
        final height = double.parse(_heightController.text);
        final weight = double.parse(_weightController.text);

        final userData =
            UserData(name: name, age: age, height: height, weight: weight);
        editUserData(userData);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data saved successfully')),
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to save data')),
        );
      }
    }
  }

  _textField({
    required String label,
    required TextEditingController controller,
    required String errorMessage,
    TextInputType inputType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMessage;
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 235, 232, 232),
          labelText: label,
          labelStyle: const TextStyle(
            color: Color.fromARGB(67, 0, 0, 0),
            fontSize: 25,
            fontFamily: 'YanoneKaffeesatz',
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(17),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'EDIT PROFILE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 326,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
              ),
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _textField(
                      label: 'Enter your name',
                      controller: _nameController,
                      errorMessage: 'Enter your name',
                    ),
                    _textField(
                      label: 'Enter your age',
                      controller: _ageController,
                      errorMessage: 'Enter your age',
                      inputType: TextInputType.number,
                    ),
                    _textField(
                      label: 'Enter your height',
                      controller: _heightController,
                      errorMessage: 'Enter your height',
                      inputType: TextInputType.number,
                    ),
                    _textField(
                      label: 'Enter your weight',
                      controller: _weightController,
                      errorMessage: 'Enter your weight',
                      inputType: TextInputType.number,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: _clearFields,
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor: Colorss.buttonColor,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(100, 50),
                          ),
                          child: const Text('CLEAR'),
                        ),
                        ElevatedButton(
                          onPressed: _saveData,
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor: Colorss.buttonColor,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(100, 50),
                          ),
                          child: const Text('SAVE'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
