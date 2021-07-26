import 'dart:io';

List mostRepeatedLetter(String text) {
  //Karakterlerin ASCİİ tablosundaki karşılıklarını aldım
  List<int> listOfLetter = text.replaceAll(" ", "").codeUnits;

  //Liste'yi Set'e dönüştürdüm böylece aynı olan karakterlerden 1 tane kaldı
  Set<int> setOfLetter = {...listOfLetter};

  int mostRepitition = 0;
  int mostRepeatedLetter = -1;
  for (var letter in setOfLetter) {
    //Her kelimenin tekrar sayısı
    int numberOfRepetition =
        listOfLetter.where((element) => element == letter).length;
    //Harfin tekrar sayısı, En çok tekrar eden harften fazla ise Güncelleme
    if (numberOfRepetition > mostRepitition) {
      mostRepitition = numberOfRepetition;
      mostRepeatedLetter = letter;
    }
  }
  //En çok tekrar eden karakter ve Tekrar sayısı
  return [String.fromCharCode(mostRepeatedLetter), mostRepitition];
}

int numberOfWord(String text) {
  // '.' yerine ' ' eklendi
  text = text.trim().replaceAll(".", " ");
  //Metin ' ' ile parçalandı
  List<String> listOfWord = text.split(" ");
  //Metinde yer alan rakamlar ve ' ' silindi
  listOfWord.removeWhere((item) => item.length < 2);
  //Kelime Sayısı
  return listOfWord.length;
}

List mostRepeatedWord(String text) {
  // '.' yerine ' ' eklendi
  text = text.trim().replaceAll(".", " ").replaceAll("?", " ");
  //Metin ' ' ile parçalandı
  List<String> listOfWord = text.split(" ");
  //Metinde yer alan rakamlar ve ' ' silindi
  listOfWord.removeWhere((item) => item.length < 3);
  //Aynı kelimeleri teke düşürme
  Set<String> setOfWord = listOfWord.toSet();

  String mostRepeatedWord = "";
  int numberOfRepetition = 0;

  //Her kelimeyi listede aratma
  for (String word in setOfWord) {
    int wordRepetition = listOfWord.where((element) => element == word).length;
    //Tekrar sayısı en çok tekrardan fazla ile güncelleme
    if (wordRepetition > numberOfRepetition) {
      mostRepeatedWord = word;
      numberOfRepetition = wordRepetition;
    }
  }
  //En çok tekrar eden kelime ve tekrar sayısı
  return [mostRepeatedWord, numberOfRepetition];
}

void main(List<String> args) {
  stdout.write("Paragraf Giriniz : ");
  String text = stdin.readLineSync()!;
  List listMostRepeatLetter = mostRepeatedLetter(text);
  List listMostRepeatedWord = mostRepeatedWord(text);
  int wordNum = numberOfWord(text);

  print(
      "'${listMostRepeatLetter[0]}' harfi '${listMostRepeatLetter[1]}' kere ile en çok tekrar eden harftir.");
  print(
      "'${listMostRepeatedWord[0]}' kelimesi '${listMostRepeatedWord[1]}' kere ile en çok tekrar eden kelimedir.");
  print("Paragrafta toplam $wordNum kelime vardır.");
}
