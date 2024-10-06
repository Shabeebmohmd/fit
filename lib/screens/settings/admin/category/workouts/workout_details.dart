import 'package:fit/color/colors.dart';
import 'package:fit/models/workout_model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WorkoutDetails extends StatefulWidget {
  final int workoutIndex;
  final WorkoutModel model;

  const WorkoutDetails({
    super.key,
    required this.model,
    required this.workoutIndex,
  });

  @override
  State<WorkoutDetails> createState() => _WorkoutDetailsState();
}

class _WorkoutDetailsState extends State<WorkoutDetails> {
  late YoutubePlayerController _playerController;

  @override
  void initState() {
    super.initState();
    _initializeYoutubeController();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _buildYoutubePlayer(),
                  const Divider(),
                  _buildWorkoutDetailCard(
                      'Workout Name', widget.model.workoutName),
                  const Divider(),
                  _buildWorkoutDetailCard(
                      'Description', widget.model.description),
                  const Divider(),
                  _buildWorkoutDetailCard(
                      'Duration', widget.model.duration.toString()),
                  const Divider(),
                  _buildDoneButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to create the YouTube player
  Widget _buildYoutubePlayer() {
    return SizedBox(
      height: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: YoutubePlayer(
          controller: _playerController,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }

  // Helper method to create the Workout Detail Cards
  Widget _buildWorkoutDetailCard(String label, String? detail) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(
          '$label: ${detail ?? 'N/A'}',
          style: const TextStyle(
            fontSize: 24,
            fontFamily: 'YanoneKaffeesatz',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Helper method to create the Done button
  Widget _buildDoneButton() {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colorss.buttonColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          'DONE',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
