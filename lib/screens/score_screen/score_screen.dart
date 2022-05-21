import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trivia_app/app_widgets/app_button.dart';
import 'package:trivia_app/controllers/question_controller.dart';
import 'package:trivia_app/screens/score_screen/widgets/score_message.dart';
import 'package:trivia_app/ui-constants/colors.dart';
import 'package:video_player/video_player.dart';

class ScoreScreen extends StatelessWidget {
  ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      builder: (controller) {
        final score = controller.score;
        final size = MediaQuery.of(context).size;
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: Text(
                    'Trivia',
                    style: AppColors.bigTextStyle.copyWith(
                        fontSize: 65,
                        foreground: Paint()..shader = AppColors.linearGradient),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(16), child: scoreText(score)),
                AppButton(
                    onTap: () {
                      controller.resetTrivia();
                      Get.offAllNamed('/welcome');
                    },
                    text: 'Restart'),
                const SizedBox(
                  height: 10,
                ),
                AppButton(
                    textColor: AppColors.primaryColor,
                    color: Colors.white,
                    onTap: () {
                      controller.resetTrivia();
                      Get.toNamed('/answers');
                    },
                    text: 'View Answers'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget scoreText(int score) {
    if (score == 0) {
      return ScoreMessage(
        score: score,
        mainMessage: "Sorry, you didn't get any correct answers,",
        subMessage: 'You can try again',
      );
    } else if (score < 4 && score > 0) {
      return ScoreMessage(
        score: score,
        mainMessage: 'You are doing great!',
        subMessage: 'You can do better!',
      );
    } else if (score >= 4 && score <= 7) {
      return ScoreMessage(
        score: score,
        mainMessage: 'Well done!',
        subMessage: 'Work a little harder!',
      );
    } else if (score > 7) {
      return ScoreMessage(
        score: score,
        mainMessage: 'Fantastic!',
        subMessage: 'You are a genius!',
      );
    }
    return ScoreMessage(
      score: score,
      mainMessage: 'Your score is unknown!',
      subMessage: 'Please try again',
    );
  }
}
