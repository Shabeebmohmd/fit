import 'package:fit/color/colors.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class BreakScreen extends StatefulWidget {
  final int initialBreakDuration;
  final VoidCallback onBreakComplete;
  final VoidCallback onSkipBreak;

  const BreakScreen({
    super.key,
    required this.initialBreakDuration,
    required this.onBreakComplete,
    required this.onSkipBreak,
  });

  @override
  State<BreakScreen> createState() => _BreakScreenState();
}

class _BreakScreenState extends State<BreakScreen> {
  late int remainingTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.initialBreakDuration;
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          _timer?.cancel();
          widget.onBreakComplete();
        }
      });
    });
  }

  void add15Seconds() {
    setState(() {
      remainingTime += 15;
    });
  }

  void skipBreak() {
    _timer?.cancel();
    widget.onSkipBreak();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Take a Break!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              '$remainingTime seconds',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.white),
                  onPressed: add15Seconds,
                  child: const Text('Add 15 Seconds'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  onPressed: skipBreak,
                  child: const Text('Skip'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
