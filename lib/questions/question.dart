import 'package:flutter/foundation.dart';

class Question {
  final String _questionText;
  final bool _questionAnswer;

  Question({
    @required String q,
    @required bool a,
  })  : this._questionAnswer = a,
        this._questionText = q;

  String get question => this._questionText;

  bool get answer => this._questionAnswer;
}
