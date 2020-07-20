import 'package:flutter/material.dart';

class QuizResult extends StatelessWidget {
  static const String quizResultRoute = '/result';
  final int _correct;
  final String _qType;

  // final _q;

  QuizResult(Map q)
      : this._correct = q['correct'],
        this._qType = q['qType'];

  // QuizResult._(this._correct, this._qType);

  Container get _scoreBanner {
    String _decoration;
    String _textData = '';

    if (_correct > 3) {
      _textData = 'Congratulations';
      _decoration = 'confetti.gif';
    } else {
      _decoration = 'proud.jpg';
    }

    Text _text = Text(
      _textData,
      style: TextStyle(
        color: Colors.white,
        fontSize: 26.0,
      ),
    );

    return new Container(
      child: Center(
        child: _text,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/$_decoration'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Expanded _getScoreColumn(bool value) {
    Icon _icon = (value)
        ? Icon(
            Icons.check,
            color: Colors.green,
            size: 40.0,
          )
        : Icon(
            Icons.close,
            color: Colors.red,
            size: 40.0,
          );

    Text _score = (value)
        ? Text(
            _correct.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          )
        : Text((10 - _correct).toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ));

    return new Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(child: _icon),
          ),
          Expanded(
            child: Center(child: _score),
          ),
        ],
      ),
    );
  }

  Expanded _getButton({
    BuildContext context,
    Color buttonColor,
    String text,
    String route,
  }) {
    return new Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 44.0,
        ),
        child: FlatButton(
          textColor: Colors.white,
          color: buttonColor,
          onPressed: () => Navigator.pushReplacementNamed(
            context,
            route,
            arguments: _qType,
          ),
          child: FittedBox(
            child: Text(
              text,
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Expanded>[
            Expanded(
              flex: 2,
              child: _scoreBanner,
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Your score is:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [true, false].map((e) => _getScoreColumn(e)).toList(),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _getButton(
                    context: context,
                    buttonColor: Colors.teal[700],
                    text: 'Restart',
                    route: '/quiz',
                  ),
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //       horizontal: 18.0,
                  //       vertical: 44.0,
                  //     ),
                  //     child: FlatButton(
                  //       textColor: Colors.white,
                  //       color: Colors.cyan[800],
                  //       onPressed: () => Navigator.pushReplacementNamed(
                  //         context,
                  //         '/',
                  //       ),
                  //       child: FittedBox(
                  //         child: Text(
                  //           'New Game',
                  //           style: TextStyle(fontSize: 22.0),
                  //         ),
                  //       ),
                  //       splashColor: Colors.transparent,
                  //       highlightColor: Colors.transparent,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
