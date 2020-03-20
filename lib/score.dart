import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Score extends StatelessWidget{
  int _score;
  int _numberOfQuestions;
  Function _resetQuizz;
  Score(this._score, this._resetQuizz, this._numberOfQuestions);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Results : Your Score is ${_score/_numberOfQuestions*100} %', style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 21)),
            RaisedButton(
              color: Colors.deepOrangeAccent,
              child: Text('Restart', style: TextStyle(fontSize: 22, color: Colors.white),),
              onPressed: _resetQuizz,
            )
          ],
        ),
      ),
    );
  }
}