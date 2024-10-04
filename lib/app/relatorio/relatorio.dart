import 'package:controle_de_bar/app/bar/bar.dart';

class Relatorio {
  Map<Bar, int> consumoPorBar = {};
  Map<Bar, int> estoqueFinalPorBar = {};

  void gerarRelatorio() {
    consumoPorBar.forEach((bar, consumo) {
      print('Consumo do bar ${bar.nome}: $consumo');
    });
    estoqueFinalPorBar.forEach((bar, estoqueFinal) {
      print('Estoque final do bar ${bar.nome}: $estoqueFinal');
    });
  }

  void exportarPDF() {
    print('Relatório exportado como PDF.');
  }
}
