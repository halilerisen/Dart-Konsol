import 'dart:io';

int sum(int number) {
  int res = 0;
  for (int i = 0; i < number; i++) res += i;
  return res;
}

main(List<String> args) {
  stdout.write("Sayı Giriniz :");
  int number = int.parse(stdin.readLineSync()!);
  print("$number kadar olan sayıların toplamı : ${sum(number)}");

}
