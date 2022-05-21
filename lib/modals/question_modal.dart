import 'dart:convert';

import 'package:html_unescape/html_unescape_small.dart';

List<Question> questionFromJson(String str) =>
    List<Question>.from(json.decode(str).map((x) => Question.fromJson(x)));

String questionToJson(List<Question> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Question {
  Question({
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  String category;
  String question;
  String correctAnswer;
  List<String> incorrectAnswers;

  factory Question.fromJson(Map<String, dynamic> json) {
    var unescape = HtmlUnescape();
    return Question(
      category: unescape.convert(json["category"]),
      question: unescape.convert(json["question"]),
      correctAnswer: unescape.convert(json["correct_answer"]),
      incorrectAnswers: List<String>.from(
          json["incorrect_answers"].map((x) => unescape.convert(x))),
    );
  }
  Map<String, dynamic> toJson() => {
        "category": category,
        "question": question,
        "correct_answer": correctAnswer,
        "incorrect_answers": List<dynamic>.from(incorrectAnswers.map((x) => x)),
      };
}
