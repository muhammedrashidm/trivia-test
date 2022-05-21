import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia_app/app_widgets/app_button.dart';
import 'package:trivia_app/controllers/question_controller.dart';
import 'package:trivia_app/screens/question_screen/widgets/question_card.dart';
import 'package:trivia_app/screens/score_screen/widgets/score_message.dart';
import 'package:trivia_app/ui-constants/colors.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      builder: (controller) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Hero(
                tag: 'logo',
                child: Text(
                  'Trivia',
                  style: AppColors.bigTextStyle.copyWith(
                      fontSize: 65,
                      foreground: Paint()..shader = AppColors.linearGradient),
                ),
              ),
              Expanded(
                child: controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Stack(
                        children: [
                          Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: PageView.builder(
                                  controller: controller.pageController,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.questions.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        QuestionCard(
                                          question: controller.questions[index],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    );
                                  },
                                  physics: const NeverScrollableScrollPhysics(),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppButton(
                                      text: 'Next',
                                      onTap: () {
                                        controller.nextQuestion();
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    AppButton(
                                        text: 'Finish',
                                        onTap: () {
                                          controller.resetTrivia();
                                        })
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        );
      },
    );
  }
}
