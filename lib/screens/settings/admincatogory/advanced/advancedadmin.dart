import 'package:flutter/material.dart';

class Advancedadmin extends StatefulWidget {
  const Advancedadmin({super.key});

  @override
  State<Advancedadmin> createState() => _AdvancedadminState();
}

class _AdvancedadminState extends State<Advancedadmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'ADVANCED',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: IconButton(onPressed: () {}, icon: const Icon(Icons.add)));
  }
}
