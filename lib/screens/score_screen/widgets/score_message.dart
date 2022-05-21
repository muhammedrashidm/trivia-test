import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia_app/controllers/question_controller.dart';
import 'package:trivia_app/ui-constants/colors.dart';

class ScoreMessage extends StatelessWidget {
  ScoreMessage({
    required this.score,
    required this.mainMessage,
    required this.subMessage,
  });

  final int score;
  final String mainMessage;
  final String subMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mainMessage,
          style: AppColors.bigTextStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '${Get.find<QuestionController>().name}.',
          style: AppColors.bigTextStyle.copyWith(fontSize: 65),
        ),
        RichText(
          text: TextSpan(
            text: 'You got ',
            style: AppColors.kResultTextStyle,
            children: <TextSpan>[
              TextSpan(
                  text: score.toString(),
                  style: AppColors.bigTextStyle.copyWith(
                    fontSize: 65,
                    foreground: Paint()..shader = AppColors.linearGradient,
                  )),
              const TextSpan(text: ' out of 10'),
              TextSpan(text: ', $subMessage'),
            ],
          ),
        ),
      ],
    );
  }

}
