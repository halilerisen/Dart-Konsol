import 'dart:io';

//For ile faktoriyel hesaplama
int cal_fac(int number) {
  int res = 1;
  for (var i = number; i > 1; i--) res *= i;

  return res;
}

//Recursive olarak faktoriyel hesaplama
dynamic rec_cal_fac(int number) {
  if (number > 1)
    return number * rec_cal_fac(number - 1);
  else
    return 1;
}

main(List<String> args) {
  print("Sayı Giriniz : ");
  int number = int.parse(stdin.readLineSync()!);
  print("Faktoriyel Sonucu : ${cal_fac(number)}");
  print("Recursive Faktoriyel Sonucu : ${rec_cal_fac(number)}");
}
