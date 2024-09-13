import 'package:fit/color/colors.dart';
import 'package:flutter/material.dart';

class Advanced extends StatefulWidget {
  const Advanced({super.key});

  @override
  State<Advanced> createState() => _AdvancedState();
}

class _AdvancedState extends State<Advanced> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'ADVANCED',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
