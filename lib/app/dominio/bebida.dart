import 'package:controle_de_bar/app/dominio/bar.dart';

class Bebida {
  int id;
  String nome;
  int quantidadeTotal;

  Bebida({
    required this.id,
    required this.nome,
    required this.quantidadeTotal,
  });

  void adicionarEstoque(int quantidade) {
    quantidadeTotal += quantidade;
  }


}
