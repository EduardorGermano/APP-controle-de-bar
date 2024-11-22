import './dto/dto_bebida.dart';
import './interface/i_dao_bebida.dart';

class Bebida {
  dynamic _id;
  String? _nome;
  int? _quantidade;
  IDAOBebida dao;

  Bebida({required this.dao});

  validar({required DTOBebida dto}) {
    nome = dto.nome;
    quantidade = dto.quantidade;
  }

  Future<DTOBebida> salvar(DTOBebida dto) async {
    validar(dto: dto);
    return await dao.salvar(dto);
  }

  Future<DTOBebida> alterar(dynamic id) async {
    this.id = id;
    return await dao.alterar(id);
  }

  Future<List<DTOBebida>> consultar(DTOBebida dto) async {
    return await dao.consultar(dto);
  }

  String? get nome => _nome;
  int? get quantidade => _quantidade;

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

  set quantidade(int? quantidade) {
    if (quantidade == null) throw Exception('Quantidade não pode ser nulo');
    if (quantidade < 0) throw Exception('Quantidade não pode ser negativo');
    _quantidade = quantidade;
  }
}
