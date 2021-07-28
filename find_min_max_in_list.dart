import 'dart:math';

int findMin(List<int> list) {
  //Listenin ilk elemanı en küçük kabul edildi
  int min = list[0];
  //En küçük elemandan daha küçük eleman var ise güncelle
  list.forEach((e) {
    if (e < min) min = e;
  });

  return min;
}

int findMax(List<int> list) {
  int max = list[0];

  list.forEach((e) {
    if (e > max) max = e;
  });

  return max;
}

main(List<String> args) {
  //100 elemanlı rastgele liste
  List<int> randomList = List.generate(100, (index) => Random().nextInt(1000));
  print("-----");
  print(randomList);
  print("-----");
  print("En Küçük : ${findMin(randomList)}");
  print("En Büyük : ${findMax(randomList)}");
}
