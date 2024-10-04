import 'package:controle_de_bar/app/bar/bar.dart';

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

  void distribuir(int quantidade, Bar bar) {
    if (quantidadeTotal >= quantidade) {
      bar.receberEstoque(quantidade);
      quantidadeTotal -= quantidade;
    } else {
      print('Estoque insuficiente.');
    }
  }
}
