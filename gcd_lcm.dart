import 'dart:io';

//Ebob Hesaplıyan Fonksiyon
int gcdCal(int n1, int n2) {
  //2 sayı eşit ise Ebob'u kendisidir
  if (n1 == n2) return n1;
  //Sayıları Böleceğimiz Asal Sayıları üretme
  Set<int> listOfPrimes =
      n1 > n2 ? generatePrimeNumbers(n1 ~/ 2) : generatePrimeNumbers(n2 ~/ 2);

  //Sayı çarpanlarını tutulan liste
  List<int> factors = [];

  for (var i = 0; i < listOfPrimes.length; i++) {
    //n1 ve n2 tam bölünüyor ise çarpandır
    if (n1 % listOfPrimes.elementAt(i) == 0 &&
        n2 % listOfPrimes.elementAt(i) == 0) {
      n1 ~/= listOfPrimes.elementAt(i);
      n2 ~/= listOfPrimes.elementAt(i);
      factors.add(listOfPrimes.elementAt(i));
      //n1 ve n2 aynı sayıya birden fazla bölünebilir.(2, 2, 2, 3, 5)
      i--;
    }
  }
  //Çarpanlar listesindeki bütün elemanların çarpımını geri döndürme
  return factors.fold(1, (value, element) => value * element);
}

//Ekok Hesaplıyan Fonksiyon
int lcmCal(int n1, int n2) {
  //2 sayı eşit ise Ekok'u kendisidir
  if (n1 == n2) return n1;
  //Sayıları Böleceğimiz Asal Sayıları üretme
  Set<int> listOfPrimes =
      n1 > n2 ? generatePrimeNumbers(n1 ~/ 2) : generatePrimeNumbers(n2 ~/ 2);
  //Sayı çarpanlarını tutulan liste
  List<int> factors = [];

  for (var i = 0; i < listOfPrimes.length; i++) {
    //n1 ve n2 tam bölünüyor ise çarpandır
    if (n1 % listOfPrimes.elementAt(i) == 0 &&
        n2 % listOfPrimes.elementAt(i) == 0) {
      n1 ~/= listOfPrimes.elementAt(i);
      n2 ~/= listOfPrimes.elementAt(i);
      factors.add(listOfPrimes.elementAt(i));
      i--;
    } 
    //Sadece n1 bölünüyor ise çarpandır
    else if (n1 % listOfPrimes.elementAt(i) == 0) {
      n1 ~/= listOfPrimes.elementAt(i);
      factors.add(listOfPrimes.elementAt(i));
      i--;
    } 
    //Sadece n2 bölünüyor ise çarpandır
    else if (n2 % listOfPrimes.elementAt(i) == 0) {
      n2 ~/= listOfPrimes.elementAt(i);
      factors.add(listOfPrimes.elementAt(i));
      i--;
    }
  }
  //n1 ve n2 bölünmeden sonra 1 değil ise çarpandır
  n1 != 1 ? factors.add(n1) : null;
  n2 != 1 ? factors.add(n2) : null;
  //Çarpanlar listesindeki bütün elemanların çarpımını geri döndürme
  return factors.fold(1, (previousValue, element) => previousValue * element);
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
  stdout.write("1. Sayıyı Giriniz :");
  int num1 = int.parse(stdin.readLineSync()!);
  stdout.write("2. Sayıyı Giriniz :");
  int num2 = int.parse(stdin.readLineSync()!);
  print("EBOB : ${gcdCal(num1, num2)}");
  print("EKOK : ${lcmCal(num1, num2)}");
}
