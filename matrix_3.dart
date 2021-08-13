import 'dart:io';
import 'dart:math';

/**
 * Konsoldan matris satır ve sütun uzunluğu alınıcak
 * Girilen uzunluklarda 2 tane matris oluşturulacak
 * Oluşturulan matrislere 1-10 arası rastgele elemanlar atanılacak
 * 2 Matris Toplamını
 * 2 Matris Çarpımını 
 * 2 Matrisin En Büyük Elemanlarının Yerini(satır, sütun)
 * ve 2 matrisin Transpozunu alan Konsol Uygulaması
 * 
 * 
 * Not : satır ve sütun sayısı eşit olmayan matrisler çarpılamaz..!!
 */

//Matris Yazdırma
void printMatrix(List<List> matrix, [String title = ""]) {
  print(title);
  for (var row in matrix) {
    print(row);
  }
  print("");
}

//Rastgele elemanlardan oluşan matris oluşturma
List<List<int>> createMatrix(int rowCount, int columnCount) {
  List<List<int>> matrix = [];

  for (int i = 0; i < rowCount; i++) {
    List<int> rowList = [];

    for (int j = 0; j < columnCount; j++) {
      rowList.add(Random().nextInt(10));
    }
    matrix.add(rowList);
  }

  return matrix;
}

//Matris Toplama
void sumMatrix(List<List<int>> matrix1, List<List<int>> matrix2) {
  List<List<int>> sumMatrix = createMatrix(matrix1.length, matrix1[0].length);

  for (int i = 0; i < matrix1.length; i++) {
    for (int j = 0; j < matrix1[i].length; j++) {
      sumMatrix[i][j] = matrix1[i][j] + matrix2[i][j];
    }
  }
  printMatrix(sumMatrix, "Matris Toplamı");
}

//Matris Çarpma
void multiMatrix(List<List<int>> matrix1, List<List<int>> matrix2) {
  if (matrix1.length != matrix2[0].length) {
    print("Satır ve Sütun Sayısı Eşit Olmayan Matrisler Çarpılamaz..!!");
    print("");
    return;
  }

  List<List<int>> multiplicationMatrix =
      createMatrix(matrix1.length, matrix1[0].length);

  for (int i = 0; i < matrix1.length; i++) {
    for (int j = 0; j < matrix1[0].length; j++) {
      int tempSum = 0;
      for (var k = 0; k < matrix1[0].length; k++) {
        tempSum += matrix1[i][k] * matrix2[k][j];
      }
      multiplicationMatrix[i][j] = tempSum;
    }
  }
  printMatrix(multiplicationMatrix, "Matris Çarpımı");
}

//Eb Büyük Elemanı Bulma
void findMaxElement(List<List<int>> matrix, String matrisName) {
  /*
  0. index => En Büyük Eleman
  1. index => En Büyük Elemanın Satırı
  2. index => En Büyük Elemanın Sütunu
   */
  List<int> maxValueList = [matrix[0][0], 0, 0];

  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[0].length; j++) {
      if (matrix[i][j] > maxValueList[0]) {
        maxValueList[0] = matrix[i][j];
        //index'ler 0'dan başladığı için 1 eklendi
        maxValueList[1] = i + 1;
        maxValueList[2] = j + 1;
      }
    }
  }
  print("$matrisName matrisin en büyük elemanı ${maxValueList[0]} "
      "${maxValueList[1]}x${maxValueList[2]} konumunda yer almaktadır. ");
  print("");
}

//Matris Transpozu
void getTranspose(List<List<int>> matrix) {
  List<List<int>> transposeList = createMatrix(matrix[0].length, matrix.length);

  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[0].length; j++) {
      transposeList[j][i] = matrix[i][j];
    }
  }
  printMatrix(transposeList, "Matris Transpozu");
}

void main(List<String> args) {
  stdout.write("Satır Sayısını Giriniz : ");
  int rowCount = int.parse(stdin.readLineSync()!);
  stdout.write("Sütun Sayısı Giriniz : ");
  int columnCount = int.parse(stdin.readLineSync()!);

  //Rastgele elemanlardan oluşan 2 tane liste oluşturma
  List<List<int>> matrix1 = createMatrix(rowCount, columnCount);
  List<List<int>> matrix2 = createMatrix(rowCount, columnCount);

  printMatrix(matrix1);
  printMatrix(matrix2);

  sumMatrix(matrix1, matrix2);

  multiMatrix(matrix1, matrix2);

  findMaxElement(matrix1, "1.");
  findMaxElement(matrix2, "2.");

  getTranspose(matrix1);
  getTranspose(matrix2);
}
