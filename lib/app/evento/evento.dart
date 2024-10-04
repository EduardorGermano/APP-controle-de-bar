import 'package:controle_de_bar/app/bar/bar.dart';
import 'package:controle_de_bar/app/estoque/estoque.dart';

class Evento {
  int id;
  String nome;
  DateTime data;
  List<Bar> bares;
  Estoque estoque;

  Evento({
    required this.id,
    required this.nome,
    required this.data,
    required this.bares,
    required this.estoque,
  });

  void iniciarDistribuicao() {
    print('Distribuição de bebidas iniciada.');
  }

  void monitorarEstoque() {
    bares.forEach((bar) {
      int estoqueBar = estoque.verificarEstoque(bar);
      print('Estoque do bar ${bar.nome}: $estoqueBar');
    });
  }

  void finalizarEvento() {
    print('Evento finalizado. Gerando relatório...');
    estoque.calcularEstoqueFinal();
  }
}
