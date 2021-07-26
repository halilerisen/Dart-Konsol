import 'dart:io';

int takeAnswer(Question question) {
  print("Cevap Nedir : ${question.question}");
  int answer = int.parse(stdin.readLineSync()!);
  return answer;
}

main(List<String> args) {
  List<Question> questions = [
    Question("5+8", 13),
    Question("8-5", 3),
    Question("5*6", 30),
    Question("12/2", 6),
  ];

  int correctAnswer = 0;

  for (var question in questions) {
    int answer = takeAnswer(question);
    if (answer == question.answer) correctAnswer++;
  }

  if (correctAnswer == questions.length)
    print("Tebrikler ${correctAnswer}/${questions.length }");
  else
    print("Tekrar Deneyiniz.!! ${correctAnswer}/${questions.length}");
}

class Question {
  String question;
  int answer;

  Question(this.question, this.answer);
}
