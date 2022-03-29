import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koobits/model/quiz.dart';
import 'package:provider/src/provider.dart';


class QuizCell extends StatelessWidget {
   QuizCell({Key? key,required this.quiz,this.ans}) : super(key: key);
  Quiz quiz;
  String? ans;

  @override
  Widget build(BuildContext context) {
    final quizProvider = context.read<Quiz>();
    return Column(
      children: [
        Row(children:[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("ID:${quiz.id}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Difficulty:${quiz.difficulty}"),
          )
            ]),
        const Spacer(),

        Row(children:[
          const Spacer(),
          Text("Question: ${quiz.question} = "),
          SizedBox(
              width: 100,
              child: TextFormField(
                initialValue: quizProvider.unSubmitAnswer[quiz.id] ?? "",
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                onChanged: (value){

                  ans= value;
                  quizProvider.unSubmitAnswer[quiz.id] = value;

                },
              )
          ),
          const Spacer()
        ]),

        const Spacer(),
      ],
    );
  }
}
