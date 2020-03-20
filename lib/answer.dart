import "package:flutter/material.dart";

class Answer extends StatelessWidget{
  Map<String, Object> _answer;
  Function _handleAnswer;
  Answer(this._answer,this._handleAnswer);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(_answer['answer'], style: TextStyle(fontSize: 16), textAlign: TextAlign.left,),
        ),
        onPressed: () => _handleAnswer(_answer),
        color: Colors.orange,
        textColor: Colors.white,
        padding: EdgeInsets.all(10),
      ),
    );
  }

}