import 'dart:io';

int multipicationWithAddition(int num1, int num2) {
  int res = 0;
  for (int i = 0; i < num2; i++) res += num1;

  return res;
}

main(List<String> args) {
  //Sadece Pozitif Sayılar
  stdout.write("1.Sayıyı Giriniz (Pozitif) : ");
  int number1 = int.parse(stdin.readLineSync()!);
  stdout.write("2.Sayıyı Giriniz (Pozitif) : ");
  int number2 = int.parse(stdin.readLineSync()!);
  print("Sonuç : ${multipicationWithAddition(number1, number2)}");
}
