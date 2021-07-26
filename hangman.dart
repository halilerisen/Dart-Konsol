import 'dart:io';
import 'dart:math';

main(List<String> args) {
  Hangman hangman = Hangman();

  while (true) {
    print("Tahminm için 2'ye basınız..");
    stdout.write("Harf Tahmini Yapınız : ");
    String letter = stdin.readLineSync()!.trim().toLowerCase();
    if (letter.length != 1)
      print("Harf uzunluğu 1 olmalıdır.!!");
    else {
      if (hangman.letterRight <= 0) {
        print("Harf Tahmin Hakkınız Bitti.!!");
        continue;
      }
      if (letter == "2") {
        stdout.write("Tahmin Yapınız :");
        String guess = stdin.readLineSync()!;
        bool isCorrect = hangman.checkGuess(guess);
        if (isCorrect)
          break;
        else {
          if (hangman.guessRight == 1) {
            print("Kalan Tahmin Hakkınız : ${hangman.guessRight}");
          } else {
            print("Tahmin hakkınız kalmadı ve ASLIDINIZ !!! :((");
            break;
          }
          continue;
        }
      }
      hangman.checkLetter(letter);
    }

    if (hangman.guestList.contains("_")) continue;
    print("TEBRİKLER BÜTÜN HARFLERİ BULDUNUZ (-_-)");
    break;
  }
}

class Hangman {
  static final List<String> turkishCities = [
    "adana",
    "adiyaman",
    "afyonkarahisar",
    "agri",
    "aksaray",
    "amasya",
    "ankara",
    "antalya",
    "ardahan",
    "artvin",
    "aydin",
    "balikesir",
    "bartin",
    "batman",
    "bayburt",
    "bilecik",
    "bingol",
    "bitlis",
    "bolu",
    "burdur",
    "bursa",
    "canakkale",
    "cankiri",
    "corum",
    "denizli",
    "diyarbakir",
    "duzce",
    "edirne",
    "elazig",
    "erzincan",
    "erzurum",
    "eskisehir",
    "gaziantep",
    "giresun",
    "gumushane",
    "hakkari",
    "hatay",
    "igdir",
    "isparta",
    "istanbul",
    "izmir",
    "kahramanmaras",
    "karabuk",
    "karaman",
    "kars",
    "kastamonu",
    "kayseri",
    "kilis",
    "kirikkale",
    "kirklareli",
    "kirsehir",
    "kocaeli",
    "konya",
    "kutahya",
    "malatya",
    "manisa",
    "mardin",
    "mersin",
    "mugla",
    "mus",
    "nevsehir",
    "nigde",
    "ordu",
    "osmaniye",
    "rize",
    "sakarya",
    "samsun",
    "sanliurfa",
    "siirt",
    "sinop",
    "sivas",
    "sirnak",
    "tekirdag",
    "tokat",
    "trabzon",
    "tunceli",
    "usak",
    "van",
    "yalova",
    "yozgat",
    "zonguldak"
  ];
  static String selectedCity =
      turkishCities[Random().nextInt(turkishCities.length)];
  List<String> guestList = List.filled(selectedCity.length, "_");

  int letterRight = 10;
  int guessRight = 2;

  //Harf Kontrolü
  void checkLetter(String letter) {
    List<int> listOfIndex = [];
    //Harf indexleri bulundu
    int index = -1;
    while (true) {
      index = selectedCity.indexOf(letter, index + 1);

      if (index == -1)
        break;
      else
        listOfIndex.add(index);
    }
    //Harf bulunan indexlere '_' yerine tahmnin edilen harf eklendi.
    for (var index in listOfIndex) {
      guestList[index] = letter;
    }
    if (listOfIndex.length == 0) letterRight--;
    print("Harf Tahmin Hakkınız : ${letterRight}");
    printGuessList();
  }

  //Tahmin Kontrolü
  bool checkGuess(String guess) {
    if (guess == selectedCity) {
      print("TEBRİKLER DOĞRU TAHMİN (-_-)");
      return true;
    } else {
      guessRight--;
      return false;
    }
  }

  void printGuessList() {
    for (var letter in guestList) {
      stdout.write(letter + " ");
    }
    print("");
  }
}
