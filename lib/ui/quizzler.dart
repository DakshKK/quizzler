import 'package:flutter/material.dart';

class QuizStart extends StatelessWidget {
  static const String quizStartRoute = '/';

  @override
  Widget build(BuildContext context) {
    // var text = Text(
    //   'Choose your Topic',
    //   style: TextStyle(
    //     color: Colors.white,
    //     fontSize: 25.0,
    //   ),
    // );
    return Material(
      child: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Center(
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              // TODO: Add a dropdown list, using opentdb.com categories.
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FlatButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      '/quiz',
                      arguments: 'random',
                    ),
                    child: Text(
                      'Let\'s start',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    color: Colors.teal[700],
                    textColor: Colors.white,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
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
