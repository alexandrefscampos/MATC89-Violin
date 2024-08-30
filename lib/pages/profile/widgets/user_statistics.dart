import 'package:flutter/material.dart';

class UserStatistic extends StatelessWidget {
  final int title;
  final String statisticName;
  final Color textColor;

  const UserStatistic({
    super.key,
    required this.title,
    required this.statisticName,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title.toString(),
          style: TextStyle(
            color: textColor,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          statisticName,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}
