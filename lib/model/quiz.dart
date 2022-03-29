class Quiz{

  Quiz({this.answer,this.id,this.difficulty,this.question});

  int? id;
  String? question;
  int? difficulty;
  String? answer;


  Map unSubmitAnswer = {};

  List<Quiz> quizList= [];

  Quiz.fromMap(Map map){
    id = map['id'];
    question = map['question'];
    difficulty = map['difficulty'];
    answer = map['answer'];
  }
}