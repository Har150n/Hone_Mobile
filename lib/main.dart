import 'package:flutter/material.dart';
import 'package:hone_mobile/pages/parent_guard.dart';
import 'package:hone_mobile/pages/privacy_policy.dart';
import 'package:hone_mobile/pages/tos.dart';
import 'package:hone_mobile/story_data/common_paths.dart';
import 'package:hone_mobile/pages/start_menu.dart';
import 'package:hone_mobile/pages/story_selection.dart';
import 'constant.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:hone_mobile/helper_functions/background_audio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  backgroundPlayer.setVolume(0.3);
  playLoopedAudio(mainBackgroundAudioPath);
  await Purchases.setLogLevel(LogLevel.debug);
  PurchasesConfiguration configuration = PurchasesConfiguration(appleApiKey);
  await Purchases.configure(configuration);
  runApp(GameApp());
}

class GameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emoquest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartMenu(),
      routes: {
        '/storySelection': (context) => StorySelection(),
        '/parentGuard': (context) => ParentGuard(),
        '/tos': (context) => TosWidget(),
        '/privacy': (context) => PrivacyWidget(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
