import 'package:flutter/material.dart';
import 'package:koobits/model/quiz.dart';
import 'package:koobits/screens/quiz_screen.dart';
import 'package:koobits/service/quiz_api.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizProvider = context.read<Quiz>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Start quiz"),
          onPressed: () async {
            Navigator.pushNamed(context, QuizScreen.routeName);
            for (var item in await getQuestions()) {
              quizProvider.quizList.add(Quiz.fromMap(item));
            }
          },
        ),
      ),
    );
  }
}
