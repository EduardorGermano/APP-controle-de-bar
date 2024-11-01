import 'package:controle_de_bar/app/banco/sqlite/dao/dao_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../lib/app/dominio/bar.dart';
import '../../lib/app/dominio/dto/dto_bar.dart';
import '../../lib/app/dominio/interface/i_dao_bar.dart';
import '../../lib/app/dominio/bar.dart';

void main() {
  group('Classe Bar - Testes dos Setters', () {
    late Bar bar;
    late DAOBar barDAO;

    setUp(() {
      bar = Bar(dao: DAOBar());
      barDAO = DAOBar();
    });

    test('ID não pode ser nulo', () {
      expect(() => bar.id = null, throwsException);
    });

    test('ID não pode ser negativo', () {
      expect(() => bar.id = -1, throwsException);
    });

    test('ID válido', () {
      bar.id = 1;
      expect(bar.dao, 1);
    });

    test('Nome não pode ser nulo', () {
      expect(() => bar.nome = null, throwsException);
    });

    test('Nome não pode ser vazio', () {
      expect(() => bar.nome = '', throwsException);
    });

    test('Nome válido', () {
      bar.nome = 'Bar do João';
      expect(bar.nome, 'Bar do João');
    });

    test('Localização não pode ser nula', () {
      expect(() => bar.localizacao = null, throwsException);
    });

    test('Localização não pode ser vazia', () {
      expect(() => bar.localizacao = '', throwsException);
    });

    test('Localização válida', () {
      bar.localizacao = 'Centro';
      expect(bar.localizacao, 'Centro');
    });

    test('Estoque Atual não pode ser nulo', () {
      expect(() => bar.estoqueAtual = null, throwsException);
    });

    test('Estoque Atual não pode ser negativo', () {
      expect(() => bar.estoqueAtual = -10, throwsException);
    });

    test('Estoque Atual válido', () {
      bar.estoqueAtual = 100;
      expect(bar.estoqueAtual, 100);
    });

    test('Responsável não pode ser nulo', () {
      expect(() => bar.responsavel = null, throwsException);
    });

    test('Responsável não pode ser vazio', () {
      expect(() => bar.responsavel = '', throwsException);
    });

    test('Responsável válido', () {
      bar.responsavel = 'João';
      expect(bar.responsavel, 'João');
    });
  });
}
