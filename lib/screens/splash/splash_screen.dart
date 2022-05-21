import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia_app/screens/score_screen/widgets/score_message.dart';
import 'package:trivia_app/screens/welcome_screen/welcome_screen.dart';
import 'package:trivia_app/ui-constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _controller.forward();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => WelcomeScreen()),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * pi,
              child: Hero(
                tag: 'logo',
                child: Text(
                  'Trivia',
                  style: AppColors.bigTextStyle.copyWith(
                      fontSize: _controller.value * 100,
                      foreground: Paint()
                        ..shader = AppColors.linearGradient),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
