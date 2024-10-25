import 'package:flutter_test/flutter_test.dart';
import '../../lib/app/dominio/bar.dart';
import '../../lib/app/dominio/dto/dto_bar.dart';
import '../../lib/app/dominio/interface/i_dao_bar.dart';
import '../../lib/app/dominio/bar.dart';

void main() {
  group('Bar Class Domain Tests', () {
    late Bar bar;

    setUp(() {
      bar = Bar(dao: null);
    });

    test('Validação de dados ao salvar', () {
      var dto = DTOBar(
          nome: 'Bar Central',
          localizacao: 'Rua Principal, 123',
          estoqueAtual: 50,
          responsavel: 'João');

      expect(() => bar.validar(dto: dto), returnsNormally);
    });

    test('Falha ao salvar com nome nulo ou vazio', () {
      var dtoNomeNulo = DTOBar(
          nome: null,
          localizacao: 'Rua Principal, 123',
          estoqueAtual: 50,
          responsavel: 'João');
      var dtoNomeVazio = DTOBar(
          nome: '',
          localizacao: 'Rua Principal, 123',
          estoqueAtual: 50,
          responsavel: 'João');

      expect(() => bar.validar(dto: dtoNomeNulo), throwsException);
      expect(() => bar.validar(dto: dtoNomeVazio), throwsException);
    });

    test('Falha ao salvar com estoque negativo', () {
      var dto = DTOBar(
          nome: 'Bar Central',
          localizacao: 'Rua Principal, 123',
          estoqueAtual: -5,
          responsavel: 'João');

      expect(() => bar.validar(dto: dto), throwsException);
    });
  });
}
