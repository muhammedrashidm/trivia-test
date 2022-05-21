import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.color = Colors.indigo,
    this.textColor = Colors.white,
  }) : super(key: key);

  final Function onTap;
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20), // 15
        decoration: BoxDecoration(
          border: Border.all(color: Colors.indigo, width: 2),
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
