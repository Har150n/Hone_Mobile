import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'start_menu.dart';
import 'story_selection.dart';

List<CameraDescription>? cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(GameApp());
}



class GameApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Emotion Detective',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StartMenu(),
        routes: {
          '/storySelection': (context) => StorySelection(),
          // Add route for the game page
        });
  }

}

