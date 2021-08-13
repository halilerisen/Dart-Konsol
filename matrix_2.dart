import 'dart:math';

/*
- Rastgele 2 tane sayı üret
- Üretilen sayı boyutlarında 1 tane matris oluştur
- İçerine 1-10 arasında rastgele sayılar ekle
- Matrisin satır satır ve sütun sütun toplamlarını ekrana yazdıran konsol uygulaması
 */
main(List<String> args) {
  List<List<int>> list = [];
  //Satırlar Toplamı
  List<int> sumOfRow = [];
  //Sütunlar Toplamı
  List<int> sumOfColumn = [];

  //Satır ve Sütun sayısı
  int rowCount = Random().nextInt(10) + 1;
  int columnCount = Random().nextInt(10) + 1;

  //Matrise 1-10 arası sayı ekleme
  for (var i = 0; i < rowCount; i++) {
    List<int> tempList = [];
    for (var i = 0; i < columnCount; i++) {
      tempList.add(Random().nextInt(10));
    }
    list.add(tempList);
    //Satır Toplamını Bulma
    sumOfRow.add(tempList.reduce((value, element) => value += element));
    //Matrisi Ekrana Yazdırma
    print(tempList);
  }

  //Sütun Toplamı Bulma
  for (int i = 0; i < columnCount; i++) {
    int tempSum = 0;
    for (int j = 0; j < list.length; j++) {
      tempSum += list[j][i];
    }
    sumOfColumn.add(tempSum);
  }

  print("");
  print("");
  for (int i = 0; i < sumOfRow.length; i++) {
    print("$i. Satır Toplamı : ${sumOfRow[i]}");
  }
  print("");
  print("");
  for (int i = 0; i < sumOfColumn.length; i++) {
    print("$i. Sütun Toplamı : ${sumOfColumn[i]}");
  }
}
