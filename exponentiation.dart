import 'dart:io';

int exponentiationCal(int num, int exponent){
  int result = 1;
  //Üst kadar sayıyı çarpma
  for (var i = 0; i < exponent; i++) 
    result *= num;

  return result;
}

main(List<String> args) {
  stdout.write("Sayı Giriniz : ");
  int num = int.parse(stdin.readLineSync()!);
  stdout.write("Kuvvet Giriniz : ");
  int exponent = int.parse(stdin.readLineSync()!);
  print("Sonuç : ${exponentiationCal(num, exponent)}");
}