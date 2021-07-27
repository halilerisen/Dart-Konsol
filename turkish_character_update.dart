String updateTurkishCharacter(String text) {
  text = text
      .replaceAll("ş", "s")
      .replaceAll("Ş", "S")
      .replaceAll("ç", "c")
      .replaceAll("Ç", "C")
      .replaceAll("ö", "o")
      .replaceAll("Ö", "O")
      .replaceAll("İ", "I")
      .replaceAll("ı", "i")
      .replaceAll("ğ", "g")
      .replaceAll("Ğ", "G")
      .replaceAll("ü", "u")
      .replaceAll("Ü", "U");

  return text;
}

main(List<String> args) {
  print(updateTurkishCharacter("öçşğüıÖÇŞİĞÜ"));
}
