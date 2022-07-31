import 'qustion.dart';

class AppBrain {
  int _qustionnum = 0;
  List<Qustion> _questionGroup = [
    Qustion(
      q: 'تركت الاوزة بصمتها في الثقافة الأنسانية باعتبارها نذير الشتاء؟',
      i: 'images/ig1.jpg',
      b: true,
    ),
    Qustion(
      q: 'تعتبر الخراف من أقل الحيونات التي تم ذكرها في الكتب السماوية ؟',
      i: 'images/ig2.jpg',
      b: false,
    ),
    Qustion(
      q: 'منذ عام 2005 أصبح كل الحمير المتواجدين في بريطانيا  لديها جواز سفر ؟',
      i: 'images/ig5.jpg',
      b: true,
    ),
    Qustion(
      q: 'يمكن للقطة تحريك فكيها إلى الجانبين ؟',
      i: 'images/ig4.jpg',
      b: false,
    ),
    Qustion(
      q: 'النمس المصري قديمًا كان يلقب بفأر فرعون فكان محبب لدى الجميع و كانوا يقدسونه ؟',
      i: 'images/ig6.jpg',
      b: true,
    ),
    Qustion(
      q: 'تنمو أسنان السناجب الأمامية باستمرار ؟',
      i: 'images/ig7.jpg',
      b: true,
    )
  ];
  void nextQuestion() {
    if (_qustionnum < _questionGroup.length - 1) {
      _qustionnum++;
    }
  }

  String getQuestionText() {
    return _questionGroup[_qustionnum].qustionTest;
  }

  String getImage() {
    return _questionGroup[_qustionnum].qustiomImage;
  }

  bool getAswer() {
    return _questionGroup[_qustionnum].qustionAnswer;
  }

  bool isFinished() {
    if (_qustionnum >= _questionGroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _qustionnum = 0;
  }
}
