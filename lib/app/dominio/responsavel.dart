import 'package:controle_de_bar/app/dominio/bar.dart';

class Responsavel {
  int id;
  String nome;
  Bar? bar;

  Responsavel({
    required this.id,
    required this.nome,
    this.bar,
  });


}
