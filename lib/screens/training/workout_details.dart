import 'dart:async';
import 'package:fit/color/colors.dart';
import 'package:fit/models/workout_model.dart';
import 'package:fit/screens/training/workout_info.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WorkoutDetails extends StatefulWidget {
  final int workoutIndex;
  final WorkoutModel model;
  final List<WorkoutModel> workouts; // Add list of workouts

  const WorkoutDetails({
    super.key,
    required this.model,
    required this.workoutIndex,
    required this.workouts, // Pass list of workouts
  });

  @override
  State<WorkoutDetails> createState() => _WorkoutDetailsState();
}

class _WorkoutDetailsState extends State<WorkoutDetails> {
  late YoutubePlayerController _playerController;
  late int time;
  Timer? _timer;
  bool isRunning = false;
  late int totalTime;

  @override
  void initState() {
    super.initState();
    _initializeYoutubeController();
    time = widget.model.duration.toInt();
    totalTime = time;
    startTimer(); // Automatically start the timer
  }

  void _initializeYoutubeController() {
    final videoID = YoutubePlayer.convertUrlToId(widget.model.url ?? '');
    if (videoID != null) {
      _playerController = YoutubePlayerController(
        initialVideoId: videoID,
        flags: const YoutubePlayerFlags(autoPlay: true, mute: true),
      );
    }
  }

  @override
  void dispose() {
    _playerController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  // Timer Logic
  void startTimer() {
    if (isRunning) return;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (time > 0) {
          time--;
        } else {
          timer.cancel();
          _loadNextWorkout(); // Automatically load the next workout when time ends
        }
      });
    });
    setState(() {
      isRunning = true;
    });
  }

  void pauseTimer() {
    _timer?.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void stopTimer() {
    _timer?.cancel();
    setState(() {
      time = totalTime;
      isRunning = false;
    });
  }

  // Logic to get the next workout
  void _loadNextWorkout() {
    if (widget.workoutIndex < widget.workouts.length - 1) {
      // If there are more workouts, go to the next workout
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WorkoutDetails(
            workoutIndex: widget.workoutIndex + 1,
            model: widget.workouts[widget.workoutIndex + 1],
            workouts: widget.workouts,
          ),
        ),
      );
    } else {
      // No more workouts, go back to the workout screen or finish
      Navigator.pop(context);
    }
  }

  // Manually skip to the next workout
  void _skipWorkout() {
    _timer?.cancel();
    _loadNextWorkout();
  }

  double get progress {
    return 1 - (time / totalTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: _buildAppBar(),
      body: Center(
        child: Column(
          children: [
            _buildYoutubePlayer(),
            const SizedBox(height: 50),
            _buildProgressIndicator(),
            const SizedBox(height: 50),
            _buildTimerButtons(),
            const SizedBox(height: 20),
            _buildSkipButton(), // Add skip button
          ],
        ),
      ),
    );
  }

  // Helper methods to improve modularity and readability
  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        widget.model.workoutName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WorkoutInfo(model: widget.model),
              ),
            );
          },
          icon: Icon(
            Icons.info_outline,
            color: Colors.purple[900],
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget _buildYoutubePlayer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 300,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: YoutubePlayer(
            controller: _playerController,
            showVideoProgressIndicator: true,
          ),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: 10,
            backgroundColor: Colors.white,
            valueColor:
                const AlwaysStoppedAnimation<Color>(Colorss.buttonColor),
          ),
        ),
        Text(
          time.toString(),
          style: const TextStyle(
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildTimerButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTimerButton(
          label: 'START',
          color: Colorss.buttonColor,
          onPressed: startTimer,
        ),
        const SizedBox(width: 10),
        _buildTimerButton(
          label: 'PAUSE',
          color: Colors.orange,
          onPressed: pauseTimer,
        ),
        const SizedBox(width: 10),
        _buildTimerButton(
          label: 'STOP',
          color: Colors.red,
          onPressed: stopTimer,
        ),
      ],
    );
  }

  Widget _buildTimerButton(
      {required String label,
      required Color color,
      required VoidCallback onPressed}) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildSkipButton() {
    return MaterialButton(
      onPressed: _skipWorkout, // Skip to the next workout
      color: Colors.blue,
      child: const Text(
        'SKIP',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
