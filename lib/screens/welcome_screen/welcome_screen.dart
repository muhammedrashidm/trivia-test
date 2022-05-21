import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia_app/controllers/question_controller.dart';
import 'package:trivia_app/screens/question_screen/question_screen.dart';
import 'package:trivia_app/screens/score_screen/score_screen.dart';
import 'package:trivia_app/screens/score_screen/widgets/score_message.dart';
import 'package:trivia_app/ui-constants/colors.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QuestionController>();
    _nameController.text = controller.name;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2),
                  Hero(
                    tag: 'logo',
                    child: Text(
                      'Trivia',
                      style: AppColors.bigTextStyle.copyWith(
                          fontSize: 65,
                          foreground: Paint()
                            ..shader = AppColors.linearGradient),
                    ),
                  ),
                  //2/6
                  const Text("Let's Play Quiz,",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 33)),
                  const Text("Enter your information below"),
                  const Spacer(), // 1/6
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: "Full Name",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide:
                              BorderSide(color: AppColors.primaryColor)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide:
                              BorderSide(color: AppColors.primaryColor)),
                    ),
                  ),
                  const Spacer(), // 1/6
                  InkWell(
                    onTap: () {
                      if (_nameController.text.trim().length > 0) {
                        controller.getQuestions();
                        controller.setName = _nameController.text;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuestionScreen()));
                      } else {
                        Get.showSnackbar(const GetSnackBar(
                          duration: Duration(seconds: 3),
                          snackPosition: SnackPosition.TOP,
                          message: "Please enter your name",
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20 * 0.75), // 15
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: const Text(
                        "Lets Start Quiz",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
