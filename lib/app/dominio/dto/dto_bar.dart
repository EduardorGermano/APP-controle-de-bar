class DTOBar {
  dynamic id;
  String nome;
  String? localizacao;
  int estoqueAtual;
  String responsavel;

  DTOBar(
      {this.id,
      required this.nome,
      this.localizacao,
      required this.estoqueAtual,
      required this.responsavel});
}
