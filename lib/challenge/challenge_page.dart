import 'package:devQuiz/challenge/challenge_controller.dart';
import 'package:devQuiz/challenge/widget/next_button/next_button_widget.dart';
import 'package:devQuiz/challenge/widget/question_indicator/question_indicator_widget.dart';
import 'package:devQuiz/challenge/widget/quiz/quiz_widget.dart';
import 'package:devQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChallengePage({Key? key, required this.questions}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  void initState() {
    // controller.currentPageNotifier.addListener(() {
    //   setState(() {});
    // });

    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });

    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
        duration: Duration(milliseconds: 2000),
        curve: Curves.decelerate,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: controller.currentPage,
                  length: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(
                  question: e,
                  onChange: () => nextPage(),
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: false,
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (value < widget.questions.length)
                    Expanded(
                      child: NextButtonWidget.white(
                        label: 'Pular',
                        onTap: () => nextPage(),
                      ),
                    ),
                  if (value == widget.questions.length)
                    Expanded(
                        child: NextButtonWidget.green(
                      label: 'Confirmar',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )),
                ],
              ),
            )),
      ),
    );
  }
}
