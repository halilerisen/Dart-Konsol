import 'dart:io';

List<int> findPrimes(int a, int b) {
  if (a < 2 || b < 2) throw Exception("En küçük Asal Sayı 2'dir..!!");

  //Asal Sayıları Tutan Liste
  List<int> primes = [];

  //a her zaman b'den küçük olmalı
  if (a > b) {
    int temp = a;
    a = b;
    b = temp;
  }

  for (var i = a; i <= b; i++) if (isPrime(i)) primes.add(i);

  return primes;
}

bool isPrime(int number) {
  for (int i = 2; i <= number / 2; i++) if (number % i == 0) return false;

  return true;
}

main(List<String> args) {
  stdout.write("1.Sayıyı Giriniz : ");
  int number1 = int.parse(stdin.readLineSync()!);
  stdout.write("2.Sayıyı Giriniz : ");
  int number2 = int.parse(stdin.readLineSync()!);

  print("2 Sayı Arasındaki Asal Sayılar :");
  print(findPrimes(number1, number2));
}
