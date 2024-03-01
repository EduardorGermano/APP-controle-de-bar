import 'dart:io';

main() {
  print('Informe a primeira nota');
  var entradaNota1 = stdin.readLineSync()!;
  var nota1 = int.parse(entradaNota1);
  bool eNota1 = true;

  if (nota1 >= 0 && nota1 <= 10) {
    print('Nota validade');
  } else {
    print('Nota invalidade');
    eNota1 = false;
  }

  print('Informe a segunda nota');
  var entradaNota2 = stdin.readLineSync()!;
  var nota2 = int.parse(entradaNota2);
  bool eNota2 = true;

  if (nota2 >= 0 && nota2 <= 10) {
    print('Nota validade');
  } else {
    print('Nota invalidade');
    eNota2 = false;
  }

  if (eNota1 && eNota2) {
    var media;
    media = (nota1 + nota2) / 2;

    print('Sua nota é: $media');
    
    if (media >= 60) {
      print('Vc foi aprovado');
    } else {
      print('Vc foi reprovado');
    }
  } else {
    print('Informe a nota correta');
  }
}
