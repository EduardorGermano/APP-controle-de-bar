import 'package:controle_de_bar/app/bar/bar.dart';
import 'package:controle_de_bar/app/bebidas/bebida.dart';

class Festa {
  late String nome;
  late List<Bar> bar;
  late List<Bebida> bebidas;
  late int quantidade;

  Festa({
    required this.nome,
    required this.bar,
    required this.bebidas,
    required this.quantidade,
  });

  void eNomeVazio() {
    if (nome.isEmpty) throw Exception("Nome não pode ser vazio");
  }

  void eBarNulo() {
    if (bar.isEmpty) throw Exception("Bar não pode ser nulo");
  }

  void eBebidasNulo() {
    if (bebidas.isEmpty) throw Exception("Bebidas não pode ser nulo");
  }

  void quantidadeNulo() {
    if (quantidade <= 0) throw Exception("Quantidade não pode ser zerada");
  }
}
