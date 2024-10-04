import 'package:controle_de_bar/app/bar/bar.dart';

class Responsavel {
  int id;
  String nome;
  Bar? bar;

  Responsavel({
    required this.id,
    required this.nome,
    this.bar,
  });

  void registrarEstoqueFinal() {
    if (bar != null) {
      print('Estoque final do bar ${bar!.nome}: ${bar!.contarEstoqueFinal()}');
    } else {
      print('Nenhum bar associado a este responsável.');
    }
  }
}
