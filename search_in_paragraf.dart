import 'dart:io';

//Tam eşleşme yapmaz, paragraf içerisinde veya kelimesi içeriside(ders => dershane)
// yer alan bütün kelimeleri sayar
int numberOfRepetitions(String paragraph, String searchedWord) {
  return paragraph.split(searchedWord).length - 1;
}

main(List<String> args) {
  // print("Paragraf Giriniz : ");
  String paragraph = stdin.readLineSync()!;

  stdout.write("Aradığınız Kelimeyi Giriniz : ");
  String searchedWord = stdin.readLineSync()!;

  print("$searchedWord kelimesi paragraf içerisinde "
      "${numberOfRepetitions(paragraph, searchedWord)} kere geçmektedir.");
}
