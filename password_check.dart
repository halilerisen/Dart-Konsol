import 'dart:io';

void checkPass(String password) {
  //Şifredeki karakterlerin ASCII tablosundaki karşılıklarını alma
  List<int> codeUnitsOfPassword = password.codeUnits;

  if (password.length < 6)
    throw Exception("Uzunluk En Az 6 Karakter Olmalıdır..!!");

  //ASCII tablosunda A = 65, Z = 90
  charCheck(codeUnitsOfPassword, 65, 90, "Büyük Harf Yok..!!");
  //ASCII tablosunda a = 97, z = 123
  charCheck(codeUnitsOfPassword, 97, 123, "Küçük Harf Yok..!!");
  //ASCII tablosunda ! = 33, / = 47
  charCheck(codeUnitsOfPassword, 33, 47, "İşaret Yok..!!");
  //ASCII tablosunda 1 = 48, 9 = 57
  charCheck(codeUnitsOfPassword, 48, 57, "Rakam Yok..!!");

  print("Şifre Kuralları Sağlıyor.");
}

//Karakterlerin şifrede olup olmadığını kontrol eden fonksiyon
void charCheck(List<int> codeUnitsOfPassword, int startValue, int finishvalue,
    String errorMessage) {
  try {
    //Listenin öğelerinden bir tanesi bile belirtilen aralıkta yok ise hata atar...!!
    codeUnitsOfPassword.firstWhere(
        (element) => (element >= startValue && element <= finishvalue));
  } catch (e) {
    throw Exception(errorMessage);
  }
}

main(List<String> args) {
  print('''
---ŞİFRE KURALLARI---
- 1 tane büyük ve küçük harf
- 1 tane işaret (!,",#,\$,%,&,',(,),*,+,',',-,.,/)
- 1 tane rakam içermelidir
- En az 6 karakter
  ''');

  stdout.write("Şifre Giriniz : ");
  String password = stdin.readLineSync()!;
  checkPass(password);
}
