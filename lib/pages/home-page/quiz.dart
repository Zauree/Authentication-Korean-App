


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

var totalScore = 0;
var quiz = new WordQuiz();
var questionNo = 0;

class WordQuiz{
  var questions =[
    "안녕 сөзінің аудармасы қандай?",
    "한국 қай мемлекеттің атауы?"
  ];

  var variants = [
    ["Қош келдің", "Жолың болсын", "Сәлем", "Сәлеметсіз бе"],
    ["Қытай", "Корея", "АҚШ", "Түркия"]
  ];

  var rightVariants= [
    "Сәлем", "Корея"
  ];
}

class WordsQuiz extends StatefulWidget {
  @override
  _WordsQuizState createState() => _WordsQuizState();
}

class _WordsQuizState extends State<WordsQuiz> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.blueGrey),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text('Cөздерді еске түсіру', style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 20
            ),),
            backgroundColor: Colors.white,
            elevation: 0.0,

          ),
          body: Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(20.0)),
                new Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      new Text("Cұрақ ${questionNo + 1} / ${quiz.questions.length}",
                        style: new TextStyle(
                            fontSize: 22.0
                        ),
                      ),

                      new Text("Көрсеткіш: $totalScore",
                        style: TextStyle(
                            fontSize: 22.0
                        ),)
                    ],
                  ),
                ),
                new Padding(padding: EdgeInsets.all(18.0)),

                new Text(quiz.questions[questionNo],
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new MaterialButton(
                      minWidth: 120.0,
                      height: 60,

                      color: Colors.blueAccent,
                      onPressed: (){
                        if (quiz.variants[questionNo][0] == quiz.rightVariants[questionNo]){
                          debugPrint("Дұрыс");
                          totalScore++;
                        } else{
                          debugPrint("Қате");
                        }

                         updateQuestion();
                      },
                      child: Text(quiz.variants[questionNo][0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                        ),),
                    ),




                    new MaterialButton(
                      minWidth: 120.0,
                      height: 60,

                      color: Colors.blueAccent,
                      onPressed: (){
                        if (quiz.variants[questionNo][1] == quiz.rightVariants[questionNo]){
                          debugPrint("Дұрыс");
                          totalScore++;
                        } else{
                          debugPrint("Қате");
                        }

                        updateQuestion();
                      },
                      child: Text(quiz.variants[questionNo][1],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                        ),),
                    ),

                  ],

                ),
                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new MaterialButton(
                      height: 60,
                      minWidth: 150.0,
                      color: Colors.blueAccent,
                      onPressed: (){
                        if (quiz.variants[questionNo][2] == quiz.rightVariants[questionNo]){
                          debugPrint("Дұрыс");
                          totalScore++;
                        } else{
                          debugPrint("Қате");
                        }

                         updateQuestion();
                      },
                      child: Text(quiz.variants[questionNo][2],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                        ),),
                    ),


                    new MaterialButton(
                      minWidth: 120.0,
                      height: 60,
                      color: Colors.blueAccent,
                      onPressed: () {
                        if (quiz.variants[questionNo][3] == quiz.rightVariants[questionNo]){
                          debugPrint("Дұрыс");
                          totalScore++;
                        } else{
                          debugPrint("Қате");
                        }

                         updateQuestion();
                      },
                      child: Text(quiz.variants[questionNo][3],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                        ),),
                    ),

                  ],

                ),

                new Padding(padding: EdgeInsets.only(top: 250.0)),

                new Container(
                  alignment: Alignment.bottomLeft,
                  child: MaterialButton(
                      height: 60.0,
                      color: Colors.redAccent,
                      onPressed: resetQuiz,
                      child: new Text("Тесттен \nшығу",
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.white
                        ), textAlign: TextAlign.center,)
                  ),
                ),



              ],
            ),
          )

      ),

    );
  }

  void resetQuiz(){
    setState(() {
      Navigator.pop(context);
      totalScore = 0;
      questionNo = 0;
    });
  }

  void updateQuestion(){
    setState(() {
      if(questionNo == quiz.questions.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Final(score: totalScore,)));

      }else{
        questionNo++;
      }
    });
  }

}

class Final extends StatelessWidget {
  final int score;


  const Final({Key key, this.score}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

        body: new Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                new Text("Дұрыс жауап саны: $score",
                  style: new TextStyle(
                      fontSize: 35.0
                  ),),

    /* new Text("Қателіктер: $(${quiz.questions.length} - $score) ",
                  style: new TextStyle(
                      fontSize: 35.0
                  ),),*/

                new Padding(padding: EdgeInsets.all(30.0)),

                new MaterialButton(
                  color: Colors.redAccent,
                  onPressed: () {
                    questionNo = 0;
                    totalScore = 0;
                    Navigator.pop(context);
                  },
                  child: new Text("Қайтадан бастау",
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                    ),),)

              ],
            ) ,
          )
        ),


      ),
    );
  }
}
