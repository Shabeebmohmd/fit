import 'package:fit/color/colors.dart';
import 'package:flutter/material.dart';

class Reoprtscreen extends StatefulWidget {
  const Reoprtscreen({super.key});

  @override
  State<Reoprtscreen> createState() => _ReoprtscreenState();
}

class _ReoprtscreenState extends State<Reoprtscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        title: const Text(
          'REPORTS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
