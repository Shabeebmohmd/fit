import 'package:flutter/material.dart';

class Intermdiateadmin extends StatefulWidget {
  const Intermdiateadmin({super.key});

  @override
  State<Intermdiateadmin> createState() => _IntermdiateadminState();
}

class _IntermdiateadminState extends State<Intermdiateadmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'INTERMEDIATE',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: IconButton(onPressed: () {}, icon: const Icon(Icons.add)));
  }
}
