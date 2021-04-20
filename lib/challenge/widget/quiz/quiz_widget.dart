import 'package:devQuiz/challenge/widget/answer/answer_widget.dart';
import 'package:devQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          AnswerWidget(
            title: "Texto da questão 2",
            isSelected: true,
            isRight: true,
          ),
        ],
      ),
    );
  }
}
