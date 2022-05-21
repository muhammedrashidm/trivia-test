import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trivia_app/controllers/question_controller.dart';
import 'package:trivia_app/modals/question_modal.dart';
import 'package:trivia_app/ui-constants/colors.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  String selectedAnswer = "";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      builder: (controller) {
        List<String> options = [
          widget.question.correctAnswer,
          ...widget.question.incorrectAnswers
        ];
        return Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.primaryColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor.withOpacity(0.4),
                blurRadius: 10,
                offset: Offset(0, 10),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' ${widget.question.question}    ',
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      return RadioListTile<String>(
                          tileColor: Colors.white,
                          activeColor: Colors.white,
                          title: Text(
                            options[index],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          value: options[index],
                          groupValue: selectedAnswer,
                          onChanged: (value) {
                            controller.setAnsweredCurrQuestion = true;
                            controller.setSelectedAnswer = value;
                            setState(() {
                              selectedAnswer = value!;
                            });
                          });
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}
