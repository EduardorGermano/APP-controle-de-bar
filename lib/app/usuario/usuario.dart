class Usuario {
  int id;
  String nome;
  String email;
  String tipo; // organizador ou responsável pelo bar

  Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.tipo,
  });

  void login() {
    print('Usuário $nome logado com sucesso.');
  }

  void acessarBar() {
    print('Acessando funcionalidades de controle do bar.');
  }
}
