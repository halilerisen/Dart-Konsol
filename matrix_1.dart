import 'dart:math';

/*
-4x20 boyutunda matris oluştur
-Matrisin İçerisine rastgele "a,b,c,...,z" harfler ekle
-Hangi harften kaç tane var ekrana yazdır...!!
*/

main(List<String> args) {
  //Matris Oluşturma
  List<List<String>> matrix = [];

  //Matris içerisine rastgele harfler ekleme
  for (int i = 0; i < 4; i++) {
    List<String> tempList = [];
    for (int j = 0; j < 20; j++) {
      tempList.add(String.fromCharCode(Random().nextInt(26) + 97));
    }
    print(tempList);
    matrix.add(tempList);
  }

  //Harflerin sayısını ve harfi ekrana yazdırma için tutulan liste
  List<int> counterList = [];
  List<String> charList = [];

  //Harfleri saydırma
  for (var i = 97; i <= 122; i++) {
    int counter = 0;
    charList.add(String.fromCharCode(i));
    for (var item in matrix) {
      item.forEach((element) {
        if (element == String.fromCharCode(i)) {
          counter++;
        }
      });
    }
    counterList.add(counter);
  }

  //Ekrana yazdırma
  print("");
  print("");
  print(charList);
  print(counterList);
}
