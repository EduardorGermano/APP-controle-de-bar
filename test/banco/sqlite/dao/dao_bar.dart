import 'package:flutter_test/flutter_test.dart';
import '../../../../lib/app/banco/sqlite/conexao.dart';
import '../../../../lib/app/banco/sqlite/dao/dao_bar.dart';
import '../../../../lib/app/dominio/dto/dto_bar.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

main() async {
  late Database db;
  late DAOBar dao;

  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    dao = DAOBar();
  });

  setUp(() async {
    db = await Conexao.iniciar();
  });

  tearDown(() async {
    deleteDatabase(db.path);
    db = await Conexao.iniciar();
  });

  tearDownAll(() async {
    db.close();
  });

  test('dao bar - teste sintaxe sql inserir', () async {
    int resultado = await db.rawInsert(
        dao.sqlInserir, ['Bar Pista', 'Piscina do meio', '1000', 'Paulo']);
    expect(resultado, isPositive);
  });

  test('dao bar - teste sintaxe sql alterar ', () async {
    int resultado = await db.rawUpdate(
        dao.sqlAlterar, ['Bar Pista', 'Piscina do meio', '1000', 'Fernando']);
    expect(resultado, isPositive);
  });

  test('dao bar - teste sintaxe sql consultar por id ', () async {
    var resultado = await db.rawQuery(dao.sqlConsultarPorId, [1]);
    expect(resultado.length, 1);
  });

  test('dao bar - teste sintaxe sql consultar ', () async {
    var resultado = await db.rawQuery(dao.sqlConsultar);
    expect(resultado.length, isPositive);
  });

  test('dao bar - teste inserir', () async {
    var dto = DTOBar(
        nome: 'Bar Pista',
        localizacao: 'Piscina do meio',
        estoqueAtual: 1000,
        responsavel: 'Monique');
    dto = await dao.salvar(dto);
    expect(dto.id, isPositive);
  });

  test('dao bar - teste alterar', () async {
    var dto = DTOBar(
        nome: 'Bar Pista',
        localizacao: 'Piscina do meio',
        estoqueAtual: 1000,
        responsavel: 'Fernando');
    dto = await dao.salvar(dto);
    var dtoAlterado = DTOBar(
        nome: 'Bar Pista',
        localizacao: 'Piscina do meio',
        estoqueAtual: 1000,
        responsavel: 'Igor');
    dtoAlterado = await dao.alterar(dtoAlterado);

    expect(dtoAlterado.responsavel, 'Igor');
  });

  test('dao bar - teste consultar por id', () async {
    var dto = DTOBar(
        nome: 'Bar Pista',
        localizacao: 'Piscina do meio',
        estoqueAtual: 1000,
        responsavel: 'Fernando');
    dto = await dao.salvar(dto);
    dto = await dao.consultarPorId(1);
    expect(dto.id, isPositive);
  });

  test('dao bar - teste consultar', () async {
    var dto = DTOBar(
        nome: 'Bar Pista',
        localizacao: 'Piscina do meio',
        estoqueAtual: 1000,
        responsavel: 'Fernando');
    dto = await dao.salvar(dto);
    var resultado = await dao.consultar();
    expect(resultado.length, isPositive);
  });
}
