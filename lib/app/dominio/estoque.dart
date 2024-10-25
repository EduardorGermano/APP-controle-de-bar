import 'package:controle_de_bar/app/dominio/bebida.dart';
import 'package:controle_de_bar/app/dominio/bar.dart';

class Estoque {
  Map<Bebida, int> estoqueTotal = {};
  Map<Bar, Map<Bebida, int>> estoqueDistribuido = {};

  void distribuirBebidas(Bar bar, Bebida bebida, int quantidade) {

    if (!estoqueDistribuido.containsKey(bar)) {
      estoqueDistribuido[bar] = {};
    }

    estoqueDistribuido[bar]?[bebida] =
        (estoqueDistribuido[bar]?[bebida] ?? 0) + quantidade;
  }

  int verificarEstoque(Bar bar) {
    int totalEstoque = 0;
    estoqueDistribuido[bar]?.forEach((bebida, quantidade) {
      totalEstoque += quantidade;
    });
    return totalEstoque;
  }

  void calcularEstoqueFinal() {
    estoqueDistribuido.forEach((bar, bebidas) {
      print('Estoque final do bar ${bar.nome}:');
      bebidas.forEach((bebida, quantidade) {
        print('${bebida.nome}: $quantidade');
      });
    });
  }
}
