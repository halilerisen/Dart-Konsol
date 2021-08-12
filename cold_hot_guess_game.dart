import 'dart:io';
import 'dart:math';

List<int> getDigits(int number) {
  List<int> digits = [];
  //Birler Basamağı
  digits.add(number % 10);
  number ~/= 10;
  //Onlar Basamağı
  digits.add(number % 10);
  number ~/= 10;
  //Yüzler Basamağı
  digits.add(number % 10);
  return digits;
}

bool guessResult(int guess, List<int> randNumberDigits) {
  //Tahmin Basamakları
  List<int> guessDigits = getDigits(guess);
  // E Y U,  Tuttuğumuz Liste
  List<String> coldHotList = [];

  for (var i = 2; i >= 0; i--) {
    if (guessDigits[i] == randNumberDigits[i])
      coldHotList.add("E");
    else if ((guessDigits[i] - randNumberDigits[i]).abs() == 1)
      coldHotList.add("Y");
    else
      coldHotList.add("U");
  }
  //Tahmin Sonucu Konsalda Yazdır
  print(coldHotList);
  //Eğer Hepsi Doğru ise true döndür
  return coldHotList.toString() == "[E, E, E]" ? true : false;
}

main(List<String> args) {
  int randNumber = Random().nextInt(900) + 100;
  //Rastgele Sayı Basamakları
  List<int> randNumberDigits = getDigits(randNumber);

  print('''
    E => Doğru Rakam
    Y => Fark 1'den Küçük
    U => Fark 1'den Büyük
    ''');
  while (true) {
    stdout.write("Tahmin Yapınız : ");
    int guess = int.parse(stdin.readLineSync()!);

    //Tahmin 3 basamaklı olmalı
    if (guess < 100 || guess > 999)
      throw Exception("Tahmin 3 Basamaklı Olmalıdır..!!");
    //Tahmin kontrol
    if (guessResult(guess, randNumberDigits)) break;
  }
}
