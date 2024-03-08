import 'dart:io';

main() {
  print('aula');
  calculadoraDeArea(valor1: 7, valor2: 5, calculaArea: calculaAreaRetangulo);
}

double calculadoraDeArea ({required double valor1, required double valor2, required Function(double, double) calculaArea }){
  var resultado = calculaArea(valor1, valor2);
  print('$resultado');
  return resultado;
}

bool ehAprovado(
    {required double nota1,
    required double nota2,
    required int faltas,
    double mediaAprovacao = 6,
    int faltasMaxima = 10}) {
  var media = (nota1 + nota2) / 2;
  var ehAprovadoNota = media >= mediaAprovacao;
  var ehAprovadoFaltas = faltas <= faltasMaxima;
  return ehAprovadoNota && ehAprovadoFaltas;
}

bool ehAprovadoF(
    {required double nota1,
    required double nota2,
    required int faltas,
    required Function(double, double) calculaMedia,
    double mediaAprovacao = 6,
    int faltasMaxima = 10}) {
  var media = calculaMedia(nota1, nota2);
  var ehAprovadoNota = media >= mediaAprovacao;
  var ehAprovadoFaltas = faltas <= faltasMaxima;
  print('$media');
  return ehAprovadoNota && ehAprovadoFaltas;
}

double calcularMediaPercetual(double nota1, double nota2) {
  double media = (nota1 * 0.6) + (nota2 * 0.4);
  return media;
}

double calcularMediaSimples(double nota1, double nota2) {
  double media = (nota1 + nota2) / 2;
  return media;
}

double calculaAreaQuadrado(double n1, double n2) {
  double calculo = n1 * n1;
  return calculo;
}

double calculaAreaRetangulo(double n1, double n2) {
  double calculo = n1 * n2;
  return calculo;
}

/*
pablo = J


*/