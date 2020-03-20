import 'package:first_app/answer.dart';
import 'package:first_app/question.dart';
import 'package:first_app/score.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class Quiz extends StatefulWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("MyApp"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(child: Text("Quizz", style: TextStyle(fontSize: 35),)),
    );
  }

  @override
  _QuizState createState() => _QuizState();
}


class _QuizState extends State<Quiz> {
  int currentQuestionIndex = 0;
  int score = 0;
  final quiz = [
    {'question':'Q1 - Which of the following countries has the smallest number of visitors per year ', 'answers': [
      {'answer': 'Vatican', 'correct': false},
      {'answer': 'Tuvalu', 'correct': true},
      {'answer': 'GreenLand', 'correct': false},
    ]
    },
    {'question': 'Which of the following games has one the Game Awards 2017', 'answers': [
      {'answer': 'The Legend Of Zelda Breath Of The Wild', 'correct': true},
      {'answer': 'Nier: Automata', 'correct': false},
      {'answer': 'Persona 5', 'correct': false},
    ]
    },
  ];

  void handleAnswer(answer){
    print("Answer of question$currentQuestionIndex");
    setState(() {
      ++currentQuestionIndex;
    });
    if (answer['correct'] == true) ++score;
  }

  void resetQuiz(){
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
    });
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Quiz"),
       backgroundColor: Colors.deepOrange,
     ),
     body:
     (currentQuestionIndex >= quiz.length) ? Score(score, resetQuiz, quiz.length) :SingleChildScrollView(
       padding: EdgeInsets.all(10),
       child: Column(
         children: <Widget>[
           Question(quiz[currentQuestionIndex]['question'], currentQuestionIndex, quiz.length),
           ...(quiz[currentQuestionIndex]['answers'] as List<Map<String, Object>>).map((answer){
             return Answer(answer, handleAnswer);
           }),
         ],
       ),
     ),
   );
  }
}

