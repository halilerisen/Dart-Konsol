import 'dart:io';

main(List<String> args) {
  stdout.write("Sayı 1 Gir : ");
  int num1 = int.parse(stdin.readLineSync()!);
  stdout.write("Sayı 2 Gir : ");
  int num2 = int.parse(stdin.readLineSync()!);

  stdout.write("Operatör Giriniz(+,-,*,/) : ");
  String? op = stdin.readLineSync();

  switch (op) {
    case "+":
      stdout.write("Sonuç : ${num1 + num2}");
      break;
    case "-":
      stdout.write("Sonuç : ${num1 - num2}");
      break;
    case "*":
      stdout.write("Sonuç : ${num1 * num2}");
      break;
    case "/":
      stdout.write("Sonuç : ${num1 / num2}");
      break;
    default:
      stdout.write("Geçersiz Operatör");
  }
}
