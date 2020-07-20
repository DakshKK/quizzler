import 'package:flutter/material.dart';
import 'package:quizzler/ui/quizPage.dart';
import 'package:quizzler/ui/quizResult.dart';
import 'package:quizzler/ui/quizzler.dart';

class RouteGenerate {
  static Route<dynamic> generate(RouteSettings settings) {
    final _args = settings.arguments;

    MaterialPageRoute _route;
    switch (settings.name) {
      case QuizStart.quizStartRoute:
        _route = new MaterialPageRoute(
          builder: (_) => new QuizStart(),
        );
        break;
      case QuizPage.quizPageRoute:
        _route = new MaterialPageRoute(
          builder: (_) => new QuizPage(_args),
        );
        break;
      case QuizResult.quizResultRoute:
        _route = new MaterialPageRoute(
          builder: (_) => new QuizResult(_args),
        );
        break;
    }

    return _route;
  }
}
