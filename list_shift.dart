import 'dart:io';

List<int> shiftList(List<int> list, int offset) {
  //Öteleme değeri listeden uzun olmamalı, aynı işlemi birden fazla yapar
  offset %= list.length;
  //Öteleme Miktarı Kadar Listenin sonundan listenin başına ekleme yapıyor
  offset = list.length - offset;

  /*
  Öteleme kadar listenin sonundan alma
  List<int> listEnd = list.sublist(offset);

  Listenin başından ötelemeye kadar alma
  List<int> listStart = list.sublist(0, offset);

  birleştirme
  return listStart.addAll(listEnd);
  */

  return list.sublist(offset)..addAll(list.sublist(0, offset));
}

main(List<String> args) {
  List<int> list = List.generate(10, (index) => index);
  print(list);

  stdout.write("Öteleme Miktarını Giriniz :");
  int shiftValue = int.parse(stdin.readLineSync()!);

  print(shiftList(list, shiftValue));
}
