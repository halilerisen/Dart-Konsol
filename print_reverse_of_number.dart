import 'dart:io';

void reverseOfNumber(int number) {
  String reverse = "";

  while (number >= 10) {
    reverse += (number % 10).toString();
    number ~/= 10;
  }

  print("Sayının Tersi : ${reverse + number.toString()}");
}

main(List<String> args) {
  stdout.write("Sayı Giriniz :");
  int number = int.parse(stdin.readLineSync()!);
  reverseOfNumber(number);
}

/*
Bir sayının 10 modu son tabanını verir.
Sürekli 10 bölüm, 10 modunu alırsak sayıyı tersten elde ederiz.
*/
