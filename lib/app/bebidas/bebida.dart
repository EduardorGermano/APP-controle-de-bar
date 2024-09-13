
class Bebida {
  late String nome;
  late String tipo;
  late double preco;
  late bool status = true;

  Bebida({
    required this.nome,
    required this.tipo,
    required this.preco,
    required this.status,
  });

  void eNomeVazio() {
    if (nome.isEmpty) throw Exception("Nome não pode ser vazio");
  }

  void statusAtivo() {
    if (status = false) throw Exception("Produto deve ser ativo");
  }

  void tipoVazio() {
    if (tipo.isEmpty) throw Exception("Tipo não pode ser vazio");
  }
}
