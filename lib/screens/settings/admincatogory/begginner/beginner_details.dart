import 'package:fit/color/colors.dart';
import 'package:fit/models/workout_model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BeginnerDetails extends StatefulWidget {
  final int workoutIndex;
  final WorkoutModel model;

  const BeginnerDetails({
    super.key,
    required this.model,
    required this.workoutIndex,
  });

  @override
  State<BeginnerDetails> createState() => _BeginnerDetailsState();
}

class _BeginnerDetailsState extends State<BeginnerDetails> {
  late YoutubePlayerController _playerController;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(widget.model.url ?? '');
    _playerController = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(autoPlay: true),
    );
    super.initState();
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // YouTube Player Section
                SizedBox(
                  height: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: YoutubePlayer(
                      controller: _playerController,
                      showVideoProgressIndicator: true,
                    ),
                  ),
                ),
                const Divider(),

                // Workout Name Card
                Card(
                  elevation: 5,
                  child: ListTile(
                    leading: Text(
                      'Workout Name: ${widget.model.workoutName}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontFamily: 'YanoneKaffeesatz',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Divider(),

                // Description Card
                Card(
                  elevation: 5,
                  child: ListTile(
                    leading: Text(
                      'Description: ${widget.model.description}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontFamily: 'YanoneKaffeesatz',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Divider(),

                // Duration Card
                Card(
                  elevation: 5,
                  child: ListTile(
                    leading: Text(
                      'Duration: ${widget.model.duration}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontFamily: 'YanoneKaffeesatz',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Divider(),

                // Done Button
                SizedBox(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
