import 'dart:io';

int countCapitalLetter(String text) {
  //String içerisinde yer alan harflerin Ascii Tablosundaki numaraları
  List<int> listOfCodeUnits = text.codeUnits;
  int numberOfCapital = 0;
  for (var letter in listOfCodeUnits)
    //Ascii Tablosunda 65-90 arası Büyük Harfler (Türkçe Karakter Kullanmayın..!!)
    if (letter >= 65 && letter <= 90) numberOfCapital++;

  return numberOfCapital;
}

main(List<String> args) {
  stdout.write("Text Giriniz : ");
  String text = stdin.readLineSync()!;
  print("Text içerisinde '${countCapitalLetter(text)}' tane büyük harf vardır.");
}
