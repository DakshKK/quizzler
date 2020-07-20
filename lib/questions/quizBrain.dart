import 'package:flutter/foundation.dart';
import 'package:quizzler/questions/question.dart';

class QuizBrain {
  int _qNo = 10;
  final List<Question> _list;

  // You can initialize a constructor using this method
  // QuizBrain(
  //   this._qType, {
  //   int qNo = 10,
  // }) {
  //   this._qNo = qNo;
  // }

  // For compulsory named parameters following can be used
  // If you use the map
  // QuizBrain(this._question);

  // Else
  QuizBrain({
    @required String qType,
  }) : this._(
          _questionBank[qType]..shuffle(),
        );

  // And the named constructor is as follows
  QuizBrain._(
    this._list,
  );

  static final Map<String, List<Question>> _questionBank = {
    'random': [
      new Question(
        q: 'Some cats are actually allergic to humans',
        a: true,
      ),
      new Question(
        q: 'You can lead a cow down stairs but not up stairs.',
        a: false,
      ),
      new Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true,
      ),
      new Question(
        q: 'A slug\'s blood is green.',
        a: true,
      ),
      new Question(
        q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        a: true,
      ),
      new Question(
        q: 'It is illegal to pee in the Ocean in Portugal.',
        a: true,
      ),
      new Question(
        q: 'No piece of square dry paper can be folded in half more than 7 times.',
        a: false,
      ),
      new Question(
        q: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        a: true,
      ),
      new Question(
        q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        a: false,
      ),
      new Question(
        q: 'The total surface area of two human lungs is approximately 70 square metres.',
        a: true,
      ),
      new Question(
        q: 'Google was originally called \"Backrub\".',
        a: true,
      ),
      new Question(
        q: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        a: true,
      ),
      new Question(
        q: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        a: true,
      ),
    ],
  };

  String get text => _list[_qNo].question;

  bool get answer => _list[_qNo].answer;

  bool get nextQuestion => (--_qNo > 0) ? true : false;
}
