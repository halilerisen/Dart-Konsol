import 'dart:io';

void printFibonacci(int stopValue) {
  List<int> fibo = [0, 1];

  while (fibo.length < stopValue)
    fibo.add(fibo[fibo.length - 2] + fibo[fibo.length - 1]);

  print(fibo);
}

main(List<String> args) {
  stdout.write("Fibonacci Dizisinin Uzunluğu : ");
  int stopValue = int.parse(stdin.readLineSync()!);
  printFibonacci(stopValue);
}
