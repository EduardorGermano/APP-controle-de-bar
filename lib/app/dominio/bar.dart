import './dto/dto_bar.dart';
import './interface/i_dao_bar.dart';

class Bar {
  dynamic _id;
  String? _nome;
  String? _localizacao;
  int? _estoqueAtual;
  String? _responsavel;
  IDAOBar dao;

  Bar({required this.dao});

  validar({required DTOBar dto}) {
    nome = dto.nome;
    localizacao = dto.localizacao;
    estoqueAtual = dto.estoqueAtual;
    responsavel = dto.responsavel;
  }

  Future<DTOBar> salvar(DTOBar dto) async {
    validar(dto: dto);
    return await dao.salvar(dto);
  }

  Future<DTOBar> alterar(dynamic id) async {
    this.id = id;
    return await dao.alterar(id);
  }

  Future<List<DTOBar>> consultar(DTOBar dto) async {
    return await dao.consultar(dto);
  }

  String? get nome => _nome;
  String? get localizacao => _localizacao;
  int? get estoqueAtual => _estoqueAtual;
  String? get responsavel => _responsavel;

  set id(int? id) {
    if (id == null) throw Exception('ID não pode ser nulo');
    if (id < 0) throw Exception('ID não pode ser negativo');
    _id = id;
  }

  set nome(String? nome) {
    if (nome == null) throw Exception('Nome não pode ser nulo.');
    if (nome.isEmpty) throw Exception('Nome não pode ser vazio.');
    _nome = nome;
  }

  set localizacao(String? localizacao) {
    if (localizacao == null) throw Exception('Local não pode ser nulo.');
    if (localizacao.isEmpty) throw Exception('Local não pode ser vazio.');
    _localizacao = localizacao;
  }

  set estoqueAtual(int? estoqueAtual) {
    if (estoqueAtual == null) throw Exception('Estoque não pode ser nulo');
    if (estoqueAtual < 0) throw Exception('Estoque não pode ser negativo');
    _estoqueAtual = estoqueAtual;
  }

  set responsavel(String? responsavel) {
    if (responsavel == null) throw Exception('Responsavel não pode ser nulo.');
    if (responsavel.isEmpty)
      throw Exception('Necessario informar um responsavel');
    _responsavel = responsavel;
  }
}
