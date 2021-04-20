import 'package:devQuiz/challenge/widget/question_indicator/question_indicator_widget.dart';
import 'package:devQuiz/challenge/widget/quiz/quiz_widget.dart';
import 'package:devQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          child: QuestionIndicatorWidget(),
        ),
      ),
      body: QuizWidget(
        title: 'O que o Flutter faz em um puteiro',
      ),
    );
  }
}
