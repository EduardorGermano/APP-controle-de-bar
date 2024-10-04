class Bar {
  int id;
  String nome;
  String localizacao;
  int estoqueAtual;
  String responsavel;

  Bar({
    required this.id,
    required this.nome,
    required this.localizacao,
    required this.estoqueAtual,
    required this.responsavel,
  });

  void receberEstoque(int quantidade) {
    estoqueAtual += quantidade;
  }

  void registrarConsumo(int quantidade) {
    estoqueAtual -= quantidade;
  }

  int contarEstoqueFinal() {
    return estoqueAtual;
  }
}
