import 'package:fit/color/colors.dart';
import 'package:flutter/material.dart';

class Intermediate extends StatefulWidget {
  const Intermediate({super.key});

  @override
  State<Intermediate> createState() => _IntermediateState();
}

class _IntermediateState extends State<Intermediate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'INTERMEDIATE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
