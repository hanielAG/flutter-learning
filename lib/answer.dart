import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);
  //const Answer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //padding: EdgeInsets.only(right: 90, left: 90),
      margin: const EdgeInsets.only(top: 5, right: 120, left: 120),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 154, 44, 218),
          elevation: 5.0,
          shadowColor: Colors.black,
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
