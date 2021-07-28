
void reverseOfNumber(int number){
  String reverse = "";

  while (number >= 10) {
    reverse += (number % 10).toString();
    number ~/= 10;
  }

  print(reverse + number.toString());

}

main(List<String> args) {
  reverseOfNumber(456789);
}

/*
Bir sayının 10 modu son tabanını verir.
Sürekli 10 bölüm, 10 modunu alırsak sayıyı tersten elde ederiz.
*/