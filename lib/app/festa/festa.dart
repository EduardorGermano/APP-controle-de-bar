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

  
}
