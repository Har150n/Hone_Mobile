import 'package:audioplayers/audioplayers.dart';

// background audio controller
var backgroundPlayer = AudioPlayer();

// plays background audio
void playLoopedAudio(String audioFilePath) async {
  backgroundPlayer.setReleaseMode(ReleaseMode.loop); // Loop the audio
  backgroundPlayer.play(AssetSource(audioFilePath));
}

void stopBackgroundAudio() async {
  backgroundPlayer.stop();
}
