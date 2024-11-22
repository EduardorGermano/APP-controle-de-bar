import '../conexao.dart';
import '../../../dominio/dto/dto_bebida.dart';
import '../../../dominio/interface/i_dao_bebida.dart';
import 'package:sqflite/sqflite.dart';

class DAOBebida implements IDAOBebida {
  late Database _db;
  final sqlInserir = '''
    INSERT INTO bebida (nome, quantidade, ml) VALUES (?,?,?,?);
  ''';
  final sqlAlterar = '''
    UPDATE bebida SET nome=?, quantidade=?, ml=? WHERE id = ?;
  ''';
  final sqlConsultarPorId = '''
    SELECT * FROM bebida WHERE id = ?;
  ''';
  final sqlConsultar = '''
    SELECT * FROM bebida;
  ''';

  @override
  Future<DTOBebida> salvar(DTOBebida dto) async {
    _db = await Conexao.iniciar();
    int id = await _db.rawInsert(sqlInserir, [dto.nome, dto.quantidade, dto.ml]);
    dto.id = id;
    return dto;
  }

  @override
  Future<DTOBebida> alterar(DTOBebida dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterar, [dto.nome, dto.quantidade, dto.ml]);
    return dto;
  }

  @override
  Future<DTOBebida> consultarPorId(int id) async {
    _db = await Conexao.iniciar();
    var resultado = (await _db.rawQuery(sqlConsultarPorId, [id])).first;
    DTOBebida bebida = DTOBebida(
        id: resultado['id'],
        nome: resultado['nome'].toString(),
        quantidade: resultado['quantidade'] as int,
        ml: resultado['ml'] as int);
    return bebida;
  }

  @override
  Future<List<DTOBebida>> consultar(dto) async {
    _db = await Conexao.iniciar();
    var resultado = await _db.rawQuery(sqlConsultar);
    List<DTOBebida> bebidas = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DTOBebida(
          id: linha['id'],
          nome: linha['nome'].toString(),
          quantidade: linha['quantidade'] as int,
          ml: linha['ml'] as int);
    });
    return bebidas;
  }
}
