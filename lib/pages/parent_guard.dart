import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hone_mobile/model/parent_question.dart';
import 'package:hone_mobile/helper_functions/parent_guard_questions.dart';
import 'package:hone_mobile/widgets/text.dart';
import 'package:hone_mobile/pages/paywall.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:hone_mobile/story_data/common_paths.dart';
import 'package:hone_mobile/helper_functions/sound_effect_audio.dart';
import 'package:hone_mobile/widgets/custom_app_bar.dart';
import 'package:hone_mobile/widgets/native_dialog.dart';

class ParentGuard extends StatefulWidget {
  @override
  _ParentGuardState createState() => _ParentGuardState();
}

class _ParentGuardState extends State<ParentGuard> {
  ParentQuestion question = getRandomParentGuardQuestion();
  bool enableClicking = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomAppBar(
                  title: "Story Selection",
                  onPressed: () {
                    Navigator.pop(context); // Navigates to the previous screen
                  },
                ),
                Expanded(child: SizedBox(height: 0.0)),
                Text('Ask your parents!', style: TextStyles.headingText(context)),
                SizedBox(height: 16),
                Text(question.question, style: TextStyles.subtitleText(context)),
                SizedBox(height: 16),
                Visibility(
                  visible: enableClicking,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // To evenly space the buttons
                    children: question.options.map((option) {
                      return ElevatedButton(
                        onPressed: () {
                          if (processParentAnswer(option)) {
                            soundEffectPlayer
                                .play(AssetSource(correctAnswerAudioPath));
                            showPaywall();
                          } else {
                            soundEffectPlayer.play(AssetSource(whoopAudioPath));
                            popAfterDelay(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            minimumSize: Size(screenWidth / 6, screenWidth / 24)),
                        child: Text(option, style: TextStyles.text(context)),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(child: SizedBox(height: 0.0)),
              ],
            )));
  }

  // returns true if answer is correct
  bool processParentAnswer(String answer) {
    if (answer == question.answer) {
      return true;
    } else {
      return false;
    }
  }

  // goes back to story selection after wrong answer
  void popAfterDelay(BuildContext context) async {
    setState(() {
      enableClicking = false;
    });
    await Future.delayed(Duration(seconds: 3));
    Navigator.pop(context);
  }

  // shows the paywall
  void showPaywall() async {
    Offerings? offerings;
    try {
      offerings = await Purchases.getOfferings();
    } on PlatformException catch (e) {
      await showDialog(
          context: context,
          builder: (BuildContext context) => ShowDialogToDismiss(
              title: "Error",
              content: e.message ?? "Unknown error",
              buttonText: 'OK'));
    }
    if (offerings == null || offerings.current == null) {
      // offerings are empty, show a message to your user
    } else {
      Navigator.pop(context);
      await showModalBottomSheet(
        useRootNavigator: true,
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
            return Paywall(
              offering: offerings!.current!,
            );
          });
        },
      );
    }
  }
}
