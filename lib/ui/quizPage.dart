import 'package:flutter/material.dart';
import 'package:quizzler/questions/quizBrain.dart';

class QuizPage extends StatefulWidget {
  static const String quizPageRoute = '/quiz';
  final String _qType;
  QuizPage(this._qType);

  @override
  _QuizPageState createState() => _QuizPageState(_qType);
}

class _QuizPageState extends State<QuizPage> {
  final List<Icon> _scoreKeeper = [];
  int _count = 0;
  final String _qType;

  final QuizBrain _quizBrain;

  _QuizPageState(String qType)
      : this._qType = qType,
        _quizBrain = new QuizBrain(qType: qType);

  Expanded _quizButton({String text, Color buttonColor, bool value}) {
    return new Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FlatButton(
          onPressed: () => _update(button: value),
          onLongPress: () => _update(button: value),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          color: buttonColor,
          textColor: Colors.white,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
      ),
    );
  }

  void _rowAdd({IconData name, Color iconColor}) {
    _scoreKeeper.add(
      Icon(
        name,
        color: iconColor,
        size: 30.0,
      ),
    );
  }

  void _update({bool button}) {
    setState(() {
      if (button == _quizBrain.answer) {
        _rowAdd(name: Icons.check, iconColor: Colors.green);
        _count++;
      } else {
        _rowAdd(name: Icons.close, iconColor: Colors.red);
      }
    });

    if (!_quizBrain.nextQuestion) {
      Navigator.pushReplacementNamed(
        context,
        '/result',
        arguments: {'correct': _count, 'qType': _qType},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 15,
                child: Center(
                  child: Text(
                    _quizBrain.text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              _quizButton(text: 'True', buttonColor: Colors.green, value: true),
              _quizButton(text: 'False', buttonColor: Colors.red, value: false),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _scoreKeeper,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
