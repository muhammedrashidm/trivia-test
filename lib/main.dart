import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia_app/controllers/question_controller.dart';
import 'package:trivia_app/data_repo/questions_repo.dart';
import 'package:trivia_app/network_helpers/api.dart';
import 'package:trivia_app/screens/score_screen/score_screen.dart';
import 'package:trivia_app/screens/splash/splash_screen.dart';
import 'package:trivia_app/screens/welcome_screen/welcome_screen.dart';

import 'screens/answers_screen/answer_screen.dart';

void setUpDependencies() async {
  //helpers
  Get.lazyPut(() => Api());

//data repo
  Get.lazyPut(() => QuestionsRepo(api: Get.find()));

  //controllers
  Get.lazyPut<QuestionController>(
      () => QuestionController(questionsRepo: Get.find()));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.indigo,
          primarySwatch: Colors.indigo,
          unselectedWidgetColor: Colors.white),
      home: SplashScreen(),
      getPages: [
        GetPage(name: '/welcome', page: () => WelcomeScreen()),
        GetPage(name: '/result', page: () => ScoreScreen()),
        GetPage(name: '/answers', page: () => const AnswerScreen()),
      ],
    );
  }
}
