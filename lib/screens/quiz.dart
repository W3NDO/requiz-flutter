import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  static String id = "Quiz_screen";
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  dynamic _quiz;
  @override
  void initState() {
    super.initState();
    _loadStoredQuiz();
  }

  void doNothing() {}

  _loadStoredQuiz() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Quiz')),
        body: Center(
          child: const Text("Quiz Screen"),
        ));
  }
}
