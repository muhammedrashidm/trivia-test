import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:trivia_app/data_repo/questions_repo.dart';
import 'package:trivia_app/modals/question_modal.dart';
import 'package:trivia_app/app_widgets/snack_bar_function.dart';

class QuestionController extends GetxController {
  final QuestionsRepo questionsRepo;

  QuestionController({required this.questionsRepo});

  PageController _pageController = PageController(initialPage: 0);
  PageController get pageController => _pageController;

  List<Question> _questions = [];
  List<Question> get questions => _questions;

  bool _answeredCurrQuestion = false;
  bool get answeredCurrQuestion => _answeredCurrQuestion;
  set setAnsweredCurrQuestion(bool value) => _answeredCurrQuestion = value;

  String? _selectedAnswer = "";
  String? get selectedAnswer => _selectedAnswer;
  set setSelectedAnswer(String? value) => _selectedAnswer = value;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _name = "";
  String get name => _name;
  set setName(String value) => _name = value;

  int _score = 0;
  int get score => _score;
  void addScore() {
    _score += 1;
    update();
  }

  Future<void> getQuestions() async {
    setIsLoading(true);
    questionsRepo.getQuestions().then((value) {
      if (value is ApiSuccess) {
        final data = value.data;
        final jsonData = json.decode(data);
        final questions = jsonData['results'];
        var res = questionFromJson(jsonEncode(questions));
        _questions = res;
        setIsLoading(false);
      } else if (value is ApiError) {
        showNackbar(
            message: value.errorMessage.toString(),
            duration: Duration(seconds: 2),
            bgColor: Colors.redAccent);

        Future.delayed(Duration(milliseconds: 1000), () {
          Get.offNamed('/');
        });

        _isLoading = false;
      }
    });
  }

  void setIsLoading(bool value) {
    _isLoading = value;
    update();
  }

  void nextQuestion() {
    if (_answeredCurrQuestion) {
      if (_questions[_pageController.page!.toInt()].correctAnswer ==
          _selectedAnswer) {
        addScore();
      }
      if (_pageController.page! == _questions.length - 1) {
        Get.offNamed('/result');
      } else {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCirc,
        );
      }
    } else {
      showNackbar(
          message: "Please Select an answer",
          duration: const Duration(seconds: 3),
          bgColor: Colors.redAccent);
    }
    _answeredCurrQuestion = false;
    _selectedAnswer = "";
  }

  void resetTrivia() {
    if (_answeredCurrQuestion = true) {}

    _selectedAnswer = "";
    _answeredCurrQuestion = false;
    Get.offNamed('/result');
    _score = 0;
  }
}
