import 'dart:io';
import 'dart:math';

//String => List
List<String> getChars(String number) {
  List<String> chars = [];

  number.codeUnits
      .forEach((element) => chars.insert(0, String.fromCharCode(element)));

  return chars;
}

List<String> replaceCharToNumber(List<String> list) {
  for (var i = 0; i < list.length; i++) {
    switch (list[i].toUpperCase()) {
      case "A":
        list[i] = "10";
        break;
      case "B":
        list[i] = "11";
        break;
      case "C":
        list[i] = "12";
        break;
      case "D":
        list[i] = "13";
        break;
      case "E":
        list[i] = "14";
        break;
      case "F":
        list[i] = "15";
        break;
    }
  }
  return list;
}

List<String> replaceNumberToChar(List<String> list) {
  for (var i = 0; i < list.length; i++) {
    switch (list[i].toUpperCase()) {
      case "10":
        list[i] = "A";
        break;
      case "11":
        list[i] = "B";
        break;
      case "12":
        list[i] = "C";
        break;
      case "13":
        list[i] = "D";
        break;
      case "14":
        list[i] = "E";
        break;
      case "15":
        list[i] = "F";
        break;
    }
  }
  return list;
}

//Diğer tabanlardan 10'luk tabana dönüştürme
int baseToTen(String number, int base) {
  //Karakterleri Alma
  List<String> charsOfNumber = getChars(number);
  //A => 10, B => 11, vb.
  charsOfNumber = replaceCharToNumber(charsOfNumber);
  int res = 0;

  for (int i = 0; i < charsOfNumber.length; i++) {
    //2 ** 3 * 1
    int temp = int.parse(charsOfNumber[i]) * pow(base, i).toInt();
    res = res + temp;
  }
  return res;
}

//Onluk tabandan diğer tabanlara dönüştürme
List<String> tenToBase(int number, int targetBase) {
  List<String> list = [];
  while (number > 0) {
    /*
    7 % 2 => 1, 3
    3 % 2 => 1, 1
    1 % 2 => 1, 0
    */
    list.insert(0, (number % targetBase).toString());
    number ~/= targetBase;
  }
  //10 => A, 11 => B, vb.
  list = replaceNumberToChar(list);
  return list;
}

main(List<String> args) {
  stdout.write("Sayı Giriniz : ");
  String number = stdin.readLineSync()!;
  stdout.write("Sayı Tabanını Giriniz : ");
  int baseOfNumber = int.parse(stdin.readLineSync()!);
  stdout.write("Hedef Tabanını Giriniz : ");
  int targetBase = int.parse(stdin.readLineSync()!);

  print(tenToBase(baseToTen(number, baseOfNumber), targetBase));
}
