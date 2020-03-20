
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Question extends StatelessWidget{
  int _currentQuestionIndex;
  String _question;
  int _numberOfQuestions;
  Question(this._question, this._currentQuestionIndex, this._numberOfQuestions);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text((_currentQuestionIndex + 1).toString()+"/"+_numberOfQuestions.toString(),
                style: TextStyle(fontSize: 22),),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Text('$_question ?', style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }
}