import 'dart:async';
import 'package:fit/color/colors.dart';
import 'package:fit/models/workout_model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BeginnerWorkoutDetails extends StatefulWidget {
  final int workoutIndex;
  final WorkoutModel model;
  const BeginnerWorkoutDetails(
      {super.key, required this.model, required this.workoutIndex});

  @override
  State<BeginnerWorkoutDetails> createState() => _BeginnerWorkoutDetailsState();
}

class _BeginnerWorkoutDetailsState extends State<BeginnerWorkoutDetails> {
  late YoutubePlayerController _playerController;
  late int time; // Store time in seconds
  Timer? _timer;
  bool isRunning = false; // To track if the timer is running
  late int totalTime; // Total workout time for circular progress

  @override
  void initState() {
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId(widget.model.url ?? '');
    _playerController = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: true),
    );

    time = widget.model.duration.toInt();
    totalTime = time;
  }

  @override
  void dispose() {
    _playerController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  // Start the timer
  void startTimer() {
    if (isRunning) return;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (time > 0) {
          time--;
        } else {
          timer.cancel();
        }
      });
    });
    setState(() {
      isRunning = true;
    });
  }

  // Pause the timer
  void pauseTimer() {
    _timer?.cancel();
    setState(() {
      isRunning = false;
    });
  }

  // Stop the timer and reset
  void stopTimer() {
    _timer?.cancel();
    setState(() {
      time = totalTime;
      isRunning = false;
    });
  }

  //circular indicator
  double get progress {
    return 1 - (time / totalTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.model.workoutName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                // video section
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 10,
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Colorss.buttonColor),
                      ),
                    ),
                    Text(
                      time.toString(),
                      style: const TextStyle(
                          fontSize: 70, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: startTimer,
                    color: Colorss.buttonColor,
                    child: const Text(
                      'START',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10),
                  MaterialButton(
                    onPressed: pauseTimer,
                    color: Colors.orange,
                    child: const Text(
                      'PAUSE',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10),
                  MaterialButton(
                    onPressed: stopTimer,
                    color: Colors.red,
                    child: const Text(
                      'STOP',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
