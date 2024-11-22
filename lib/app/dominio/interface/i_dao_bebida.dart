import 'package:controle_de_bar/app/dominio/dto/dto_bebida.dart';

abstract class IDAOBebida {
  Future<DTOBebida> salvar(DTOBebida dto);
  Future<DTOBebida> alterar(DTOBebida dto);
  Future<DTOBebida> consultarPorId(int id);
  Future<List<DTOBebida>> consultar(DTOBebida dto);
}
