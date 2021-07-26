import 'dart:io';

Set<int> listOfPrimeFactor(int number) {
  Set<int> listOfPrime = {};
  int numberCopy = number;

  for (int i = 2; i <= number / 2; i++) {
    if (numberCopy % i == 0) {
      listOfPrime.add(i);
      numberCopy = numberCopy ~/ i;

      i--;
    }
  }
  return listOfPrime;
}

main(List<String> args) {
  stdout.write("Sayi Giriniz : ");
  int number = int.parse(stdin.readLineSync()!);
  print("Girdiğiniz Sayının Asal Çarpanları : ${listOfPrimeFactor(number)}");
}
