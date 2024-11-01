import '../conexao.dart';
import '../../../dominio/dto/dto_bar.dart';
import '../../../dominio/interface/i_dao_bar.dart';
import 'package:sqflite/sqflite.dart';

class DAOBar implements IDAOBar {
  late Database _db;
  final sqlInserir = '''
    INSERT INTO bar (nome, localizacao, estoque_atual, responsavel)
    VALUES (?,?,?,?,?)
  ''';
  final sqlAlterar = '''
    UPDATE bar SET nome=?, localizacao=?, estoque_atual=?, responsavel=?
    WHERE id = ?
  ''';
  final sqlConsultarPorId = '''
    SELECT * FROM bar WHERE id = ?;
  ''';
  final sqlConsultar = '''
    SELECT * FROM bar;
  ''';

  @override
  Future<DTOBar> salvar(DTOBar dto) async {
    _db = await Conexao.iniciar();
    int id = await _db.rawInsert(sqlInserir,
        [dto.nome, dto.localizacao, dto.estoqueAtual, dto.responsavel]);
    dto.id = id;
    return dto;
  }

  @override
  Future<DTOBar> alterar(DTOBar dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterar,
        [dto.nome, dto.localizacao, dto.estoqueAtual, dto.responsavel, dto.id]);
    return dto;
  }

  @override
  Future<DTOBar> consultarPorId(int id) async {
    _db = await Conexao.iniciar();
    var resultado = (await _db.rawQuery(sqlConsultarPorId, [id])).first;
    DTOBar professor = DTOBar(
        id: resultado['id'],
        nome: resultado['nome'].toString(),
        localizacao: resultado['localizacao'].toString(),
        estoqueAtual: resultado['estoque_atual'] as int,
        responsavel: resultado['responsavel'].toString());
    return professor;
  }

  @override
  Future<List<DTOBar>> consultar(dto) async {
    _db = await Conexao.iniciar();
    var resultado = await _db.rawQuery(sqlConsultar);
    List<DTOBar> professores = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DTOBar(
          id: linha['id'],
          nome: linha['nome'].toString(),
          localizacao: linha['localizacao'].toString(),
          estoqueAtual: linha['estoque_atual'] as int,
          responsavel: linha['responsavel'].toString());
    });
    return professores;
  }
}
