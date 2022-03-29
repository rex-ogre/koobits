import 'package:flutter/material.dart';
import 'package:koobits/model/quiz.dart';
import 'package:koobits/screens/result_screen.dart';
import 'package:koobits/service/quiz_api.dart';
import 'package:koobits/wigets/quiz_cell.dart';
import 'package:provider/provider.dart';
class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);
  static String routeName = "/quiz";

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late PageController _controller;
  late final quizProvider = context.read<Quiz>();
  Map<int,QuizCell> quizWidget  = {};

  @override
  void initState()  {
    super.initState();

    _controller = PageController(initialPage: 0);
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: const Text("testing"),
        ),
        body: PageView.builder(
          controller: _controller,
          itemCount: quizProvider.quizList.length,
          itemBuilder: (context, index) {

          quizWidget[quizProvider.quizList[index].id!] = QuizCell(quiz:quizProvider.quizList[index],ans: quizProvider.unSubmitAnswer[quizProvider.quizList[index].id!],);
          return   Column(
                  children:[
                    const Spacer(),
                    SizedBox(
                      height: 400,
                      width: 400,
                      child: quizWidget[quizProvider.quizList[index].id!],
                    ),
                    Row(children:[
                      const Spacer(),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        //if it is first quiz,there is no preious
                        child: ElevatedButton(onPressed: index==0?null: (){
                          _controller.jumpToPage(index-1);
                        },
                            child: const Text("Previous")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(onPressed:
                            //if it is last quiz,there is no Next
                          index==9 ? null : (){
                          _controller.jumpToPage(index+1);
                        }, child: const Text("Next")),
                      ),
                      const Spacer()
                    ]
                    ),

                    index!=9 ? Container() : ElevatedButton(onPressed: ()async{
                      //Calculate score
                      List<Map> _answerList = [];
                      quizWidget.forEach((key, value) {
                        _answerList.add({key:{'examAnswer':value.ans,'quizAnswer':value.quiz.answer}});
                      });
                    Map  _submitResult =  await submitQuestions(_answerList);

                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>ResultScreen(submitResult: _submitResult)));
                      quizProvider.unSubmitAnswer.clear();
                    }, child: const Text("submit")),
                    const Spacer()

                  ]
              );

          },
        ));
  }
}
