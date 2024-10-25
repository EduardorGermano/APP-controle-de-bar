class DTOBar {
  dynamic id;
  final String nome;
  final String? localizacao;
  final int estoqueAtual;
  final String responsavel;

  DTOBar(
      {this.id,
      required this.nome,
      this.localizacao,
      required this.estoqueAtual,
      required this.responsavel});
      
}
