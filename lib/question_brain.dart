
import 'question.dart';

class QuestionBrain{
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question('A .class file contains bytecodes?', true),
    Question('James Gosling is father of Java?', true),
    Question('Java technology is both a programming language and a platform?', true),
    Question('Java is a object oriented programing language?', true),
    Question('Newton is called the father of chemistry?', false),
    Question('A server can run on a workstation computer?', true),
    Question('Network services do not include messaging?', false),
    Question('In a peer-to-peer network, any client computer can also be a server?', true),
    Question('UTP is the cheapest cabling choice?', true),
    Question('In an instance method or a constructor, "this" is a reference to the current object?', true),
    Question('Garbage Collection is manual process?', false),
    Question('The JRE deletes objects when it determines that they are no longer being used. This process is called Garbage Collection?', true),
    Question('Constructor overloading is not possible in Java?', false),
    Question('Assignment operator is evaluated Left to Right?', false),
    Question('All binary operators except for the assignment operators are evaluated from Left to Right?', true),
    Question('Java programming is not statically-typed, means all variables should not first be declared before they can be used?', false),
    Question('In Java SE 7 and later, underscore characters "_" can appear anywhere between digits in a numerical literal?', true),
    Question('Variable name can begin with a letter, "$", or "_"?', true),
    Question('Interfaces can be instantiated?', false),
    Question('The modifiers public and static cannot written in either order "public static" or "static public"?', false),
  ];
  void nextQuestion(){
    if(_questionNumber < _questionBank.length-1){
      _questionNumber++;
    }else if(_questionNumber >= _questionBank.length-1){
      _questionNumber =0;
    }

  }

  int getQuestionNumber(){
    return _questionNumber;
  }
  int getquestionBankLength(){
    return _questionBank.length;
  }
  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }
  bool getQuestionAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }
}