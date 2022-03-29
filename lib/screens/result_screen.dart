import 'package:flutter/material.dart';
import 'package:koobits/screens/quiz_screen.dart';

class ResultScreen extends StatelessWidget {
   ResultScreen({Key? key,required this.submitResult}) : super(key: key);
  Map submitResult;
  static String routeName = "/result";
  @override
  Widget build(BuildContext context) {
    print(submitResult);
    String _answer = '';
    for (var i in submitResult['answer']){
      i.forEach((key,value){

        _answer += "Question${key}:\nYour answer: ${value['examAnswer']??"None"}, Question's answer:${value['quizAnswer']}\n";
      });
    }
    return Scaffold(

      appBar: AppBar(
        title: const Text("Result"),
      ),
      body: Column(
        children:[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Score:${submitResult['score']}",
            style: const TextStyle(fontSize: 20),),
          ),
          const Spacer(),
          Center(
            child: Text(_answer,style: const TextStyle(
                // fontSize: 14.0,
                height: 1.5
            ),),
          ),
        ElevatedButton(onPressed: (){
          Navigator.pushReplacementNamed(context, QuizScreen.routeName);
        }, child: const Text("Retry")),
        const Spacer()
        ]
      ),
    );
  }
}
