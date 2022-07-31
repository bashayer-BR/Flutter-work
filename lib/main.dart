import 'package:flutter/material.dart';
// import 'qustion.dart';
import 'app_brin.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(const examApp());
}

class examApp extends StatelessWidget {
  const examApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('اختبار'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answerResult = [];
  int rightAnswer = 0;
  void checkanswer(bool thechoice) {
    setState(() {
      bool correctans = appBrain.getAswer();
      if (thechoice == correctans) {
        answerResult.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
        rightAnswer++;
      } else {
        answerResult.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        ));
      }
      if (appBrain.isFinished() == true) {
        //appBrain.reset();
        Alert(
          context: context,
          //type: AlertType.error,
          title: "تهانينا",
          desc: " لقد اجبت على كل الأسئلة و نتيجتك هي $rightAnswer من أصل 6.",
          buttons: [
            DialogButton(
              child: Text(
                "أبدأ من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        appBrain.reset();
        answerResult = [];
        rightAnswer = 0;
      } else {
        appBrain.nextQuestion();
      }
      // qustionnum++;
    });
  }

  // List<String> qustions = [
  //   'تركت الاوزة بصمتها في الثقافة الأنسانية باعتبارها نذير الشتاء؟',
  //   'تعتبر الخراف من أقل الحيونات التي تم ذكرها في الكتب السماوية ؟',
  //   'منذ عام 2005 أصبح كل الحمير المتواجدين في بريطانيا  لديها جواز سفر ؟',
  //   'يمكن للقطة تحريك فكيها إلى الجانبين ؟',
  // ];
  // List<String> qustionImage = [
  //   'images/ig1.jpg',
  //   'images/ig2.jpg',
  //   'images/ig5.jpg',
  //   'images/ig4.jpg',
  // ];
  // List<bool> aswer = [
  //   true,
  //   false,
  //   true,
  //   false,
  // ];

  // Qustion qustion1 = Qustion(
  //     q: 'تركت الاوزة بصمتها في الثقافة الأنسانية باعتبارها نذير الشتاء؟',
  //     i: 'images/ig1.jpg',
  //     b: true);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: answerResult,
      ),
      Expanded(
        flex: 5,
        child: Column(
          children: [
            Image.asset(appBrain.getImage()),
            SizedBox(
              height: 20.0,
            ),
            Text(
              appBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
      Row(
        children: [
          Expanded(
              child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey),
            ),
            onPressed: () {
              checkanswer(true);

              //qustionnum = qustionnum + 1;
            },
            child: Text(
              'صح',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
          )),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
              child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey),
            ),
            onPressed: () {
              checkanswer(false);
              // setState(() {
              //   qustionnum++;
              // });
            },
            child: Text(
              'خطأ',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
          )),
        ],
      ),
    ]);
  }
}
