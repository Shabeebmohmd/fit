import 'package:fit/color/colors.dart';
import 'package:fit/screens/settings/admincatogory/adminscreen.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final String _username = "user";
  final String _password = "123";

  void _login() async {
    if (_usernameController.text == _username &&
        _passwordController.text == _password) {
      FocusScope.of(context).unfocus();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 300), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Adminscreen()));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Log in!',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
      ),
      body: Center(
        child: Container(
          width: 330,
          height: 270,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 27, vertical: 27),
                      child: TextFormField(
                        controller: _usernameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Icorrect user name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[300],
                            labelText: 'User name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17))),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Incorrect password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[300],
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17))),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    _login();
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.white),
                  child: const Text('Log in'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
