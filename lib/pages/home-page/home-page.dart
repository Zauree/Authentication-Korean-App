
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter_korean_app/pages/home-page/quiz.dart';
import 'package:firebase_flutter_korean_app/resources/auth.dart';
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




class Home extends StatelessWidget {

  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Корей тілін үйрену', style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 20
        ),),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.logout, color: Colors.black26,),
              label: Text('',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 10
                ),),
              onPressed: ()async{
              await _auth.signOut();
              },
          )

        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        alignment: Alignment.topCenter,
        child: Center(child: RaisedButton(
            color: Colors.blue[400],
            child: Text(
              'Tecтті бастау',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WordsQuiz()),
              );
            }

        ),)

      )

    );
  }


}
