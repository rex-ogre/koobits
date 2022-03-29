

Future<List<Map>> getQuestions()async{
  return  [
    {'id':1,'question':'1+1','difficulty':1,'answer':'2'},
    {'id':2,'question':'1+2','difficulty':1,'answer':'3'},
    {'id':3,'question':'1+3','difficulty':1,'answer':'4'},
    {'id':4,'question':'1+4','difficulty':1,'answer':'5'},
    {'id':5,'question':'1+5','difficulty':2,'answer':'6'},
    {'id':6,'question':'1+6','difficulty':2,'answer':'7'},
    {'id':7,'question':'1+7','difficulty':2,'answer':'8'},
    {'id':8,'question':'1+8','difficulty':3,'answer':'9'},
    {'id':9,'question':'1+9','difficulty':3,'answer':'10'},
    {'id':10,'question':'1+10','difficulty':3,'answer':'11'},
  ];

}
Future<Map> submitQuestions(List<Map> ans) async{
  int score=0;

  for (var item in ans){
      item.forEach((key, value) {
        if (value['examAnswer']==value['quizAnswer'].toString()){
          score+=1;
        }

      });

  }

  return {'answer':ans,"score":score};
}