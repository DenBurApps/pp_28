import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import '../../helpers/constants.dart';
import '../../helpers/image/image_helper.dart';
import '../../services/navigation/route_names.dart';
import '../../storage/storage_service.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  //final _quizBox = Hive.box('appBox');

  late int index;

  int trying = 0;

  int correctAnswers = 0;

  int incorrectAnswers = 0;

  bool canShowResult = false;

  int? _yourAnswer;

  var _questions = [];

  @override
  void initState() {
    super.initState();
    //_quizBox.put('chance', 10);
    index = 0;
  }

  void validate(choice) async {
    setState(() {
      _yourAnswer = choice;
    });

    if (choice == _questions[index]["answer"]) {
      setState(() {
        correctAnswers++;
        trying++;
      });
    } else {
      setState(() {
        incorrectAnswers++;
        trying++;
        //_quizBox.put('chance', _quizBox.get('chance') - 1);
      });
    }

    if (trying == _questions.length ||
        //_quizBox.get('chance') == 0 ||
        index == _questions.length - 1) {
      Timer(const Duration(seconds: 1), () => canShowResult = true);
    }
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _yourAnswer = null;
    });
    if (index >= _questions.length - 1) return;
    index++;
  }

  @override
  Widget build(BuildContext context) {
    final indexOfQuestions =
        ModalRoute.of(context)!.settings.arguments as Map<String, int?>;
    final i = indexOfQuestions['index'];
    var questions = allQuestions[i!];
    _questions = questions;
    final question = questions[index] as Map<String, dynamic>;
    final options = question['options'] as List<String>;
    if (canShowResult == true) {
      return QuizResultView(
        totalAnswers: 5,
        correctAnswers: correctAnswers,
        onPressed: () {
          setState(() {
            canShowResult = false;
            index = 0;
            trying = 0;
            correctAnswers = 0;
            incorrectAnswers = 0;
            canShowResult = false;
            Navigator.of(context).pushNamed(RouteNames.quiz);
          });
        },
        title: (correctAnswers == 5) ? 'Good job!' : 'Try again!',
        questionNumber: i + 1,
      );
    } else {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Text(
                  'Lesson №${i + 1}',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: index / 5,
                  color: const Color(0xff71E9AF),
                  backgroundColor: const Color(0xffEEF0F7),
                ),
                const Spacer(),
                SizedBox(
                  width: 230,
                  height: 230,
                  child: ImageHelper.getImage(ImageNames.finance),
                ),
                const Spacer(),
                QuizQuestionCard(
                  question: question["question"],
                  step: index + 1,
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: QuizAnswerCard(
                        answer: options[0],
                        isCorrectAnswer: questions[index]['answer'] == 0,
                        isYourAnswer: _yourAnswer == 0,
                        isProcessing: _yourAnswer != null,
                        onPressed: () {
                          validate(0);
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: QuizAnswerCard(
                        answer: options[1],
                        onPressed: () {
                          validate(1);
                        },
                        isYourAnswer: _yourAnswer == 1,
                        isProcessing: _yourAnswer != null,
                        isCorrectAnswer: questions[index]['answer'] == 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: QuizAnswerCard(
                        answer: options[2],
                        onPressed: () {
                          validate(2);
                        },
                        isYourAnswer: _yourAnswer == 2,
                        isProcessing: _yourAnswer != null,
                        isCorrectAnswer: questions[index]['answer'] == 2,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: QuizAnswerCard(
                        answer: options[3],
                        onPressed: () {
                          validate(3);
                        },
                        isYourAnswer: _yourAnswer == 3,
                        isProcessing: _yourAnswer != null,
                        isCorrectAnswer: questions[index]['answer'] == 3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    }
  }
}

class QuizAnswerCard extends StatelessWidget {
  const QuizAnswerCard({
    super.key,
    required this.answer,
    required this.onPressed,
    required this.isCorrectAnswer,
    required this.isYourAnswer,
    required this.isProcessing,
  });

  final String answer;
  final VoidCallback onPressed;
  final bool isCorrectAnswer;
  final bool isYourAnswer;
  final bool isProcessing;

  Color _getColor() {
    if (!isProcessing) return const Color(0xFF1C1B1B);
    if (isYourAnswer && !isCorrectAnswer) return const Color(0xFFFF5F76);
    if (isCorrectAnswer) return const Color(0xFF37736A);
    return const Color(0xFFF1C1B1B);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: SizedBox(
          height: 110,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(_getColor()),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black12, width: 1),
                    borderRadius: BorderRadius.circular(20)))),
            child: Center(
                child: Text(answer,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Colors.white))),
          ),
        ));
  }
}

class QuizQuestionCard extends StatelessWidget {
  const QuizQuestionCard(
      {super.key, required this.question, required this.step});

  final String question;
  final int step;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Text(
            question,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class QuizResultView extends StatelessWidget {
  QuizResultView(
      {super.key,
      required this.totalAnswers,
      required this.correctAnswers,
      required this.onPressed,
      required this.title,
      required this.questionNumber});

  final int totalAnswers;
  final int correctAnswers;
  final VoidCallback onPressed;
  final int questionNumber;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Text('Step 2/2', style: Theme.of(context).textTheme.labelLarge),
              SizedBox(height: MediaQuery.of(context).size.height / 12),
              SizedBox(
                width: 211,
                height: 285,
                child: ImageHelper.getImage(ImageNames.finish),
              ),
              const SizedBox(height: 20),
              Text(title, style: Theme.of(context).textTheme.labelLarge),
              Text('$correctAnswers/5 correct answers', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Color(0xff86B7B0))),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 20,
                  left: MediaQuery.of(context).size.width / 3.2,
                  right: MediaQuery.of(context).size.width / 3.2,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteNames.homeMenu);
                      },
                      child: Text(
                        'Back',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
