import 'dart:io';

//Asal Sayıları Bulan Fonksiyon
List<int> listOfPrimeFactor(int number) {
  //Asal Çarpanlar Listesi
  List<int> listOfPrimeFactors = [];
  //Hesaplamada kullanacağımız asal sayıları üretiyoruz.
  Set<int> listOfPrime = generatePrimeNumbers(number ~/ 2);

  for (int i = 0; i < listOfPrime.length; i++) {
    //Eğer bölünürse asal çarpandır
    if (number % listOfPrime.elementAt(i) == 0) {
      listOfPrimeFactors.add(listOfPrime.elementAt(i));
      number = number ~/ listOfPrime.elementAt(i);
      //Tekrar bölünüyor mu kontrol etmek için i--
      i--;
    }
  }
  return listOfPrimeFactors;
}

//Verilen Sayıya Kadar Asal Sayı Üreten Fonksiyon
Set<int> generatePrimeNumbers(int number) {
  Set<int> primeNumbers = {};
  for (int i = 2; i < number; i++) {
    //Her sayı Varsayılan Olarak Asal
    bool isPrime = true;
    //Bir sayının kendisinden sonra en büyük böleni yarısıdır.
    for (int k = 2; k < i; k++) {
      //Eğer Sayı Herhangi bir sayıya bölünürse Asal Değildir.
      if (i % k == 0) {
        isPrime = false;
        break;
      }
    }

    if (isPrime) primeNumbers.add(i);
  }
  return primeNumbers;
}

main(List<String> args) {
  stdout.write("Sayi Giriniz : ");
  int number = int.parse(stdin.readLineSync()!);
  print("Girdiğiniz Sayının Asal Çarpanları : ${listOfPrimeFactor(number)}");
}
