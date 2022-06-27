import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetAll;

  Results(this.resultScore, this.resetAll);

  String get resultPhrase {
    var resultText = 'dale';
    if (resultScore <= 7) {
      resultText = 'Seu resultado:\ncoitado...';
    } else if (resultScore <= 16) {
      resultText = 'Seu resultado:\ntem salvação';
    } else if (resultScore <= 22) {
      resultText = 'Seu resultado:\ntu é de boa';
    } else {
      resultText = 'Seu resultado:\ntu é brabo!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            '\n\n' + resultPhrase + '\n',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 122, 13, 186),
                elevation: 5.0,
                shadowColor: Colors.black,
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, right: 20, left: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: resetAll,
              child: const Text('Refazer'))
        ],
      ),
    );
  }
}
