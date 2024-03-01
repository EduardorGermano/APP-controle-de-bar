import 'dart:io';

main() {
  void solicitarNota() {
    print('Informe a primeira nota');
    var entradaNota1 = stdin.readLineSync()!;
    var nota1 = int.parse(entradaNota1);
    bool eNota1 = true;

    print('Informe a segunda nota');
    var entradaNota2 = stdin.readLineSync()!;
    var nota2 = int.parse(entradaNota2);
    bool eNota2 = true;
  }

  
}
