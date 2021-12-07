import 'package:flutter/material.dart';
import 'question_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionBrain questionBrain = QuestionBrain();
int s =0;
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    String score = s.toString();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 0,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'Score:'+score,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
                color: Colors.red,
                child: const Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  //The user picked false.
                  checkAnswer(false);
                }
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scorekeeper,
        )
      ],
    );
  }

  List<Icon> scorekeeper = [];


  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer = questionBrain.getQuestionAnswer();
    setState(() {
      if(questionBrain.getquestionBankLength()-1==questionBrain.getQuestionNumber()){
        Alert(
          context: context,
          type: AlertType.error,
          title: "Mission Completed",
          desc: "You have completed this challenge ! Please Start again.",
          buttons: [
            DialogButton(
              child: Text(
                "Start again.",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: ()  {Navigator.pop(context);

              },
              width: 120,
            )
          ],
        ).show();
        scorekeeper.clear();
        s=0;
        questionBrain.nextQuestion();

      }
      else{
        if(userPickedAnswer == correctAnswer){
          scorekeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
          s++;
        }
        else{
          scorekeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));

        }
        questionBrain.nextQuestion();

      }
    });



}

  }





