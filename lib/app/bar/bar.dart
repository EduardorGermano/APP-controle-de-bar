
class Bar {
  late String nome;
  late String local;
  late bool status = true;

  Bar({
    required this.nome,
    required this.local,
    required this.status,
  });

  void eNomeVazio() {
    if (nome.isEmpty) throw Exception("Nome não pode ser vazio");
  }

  void localVazio() {
    if (local.isEmpty) throw Exception("Local não pode ser vazio");
  }

  void statusAtivo() {
    if (status = false) throw Exception("Produto deve ser ativo");
  }
}
