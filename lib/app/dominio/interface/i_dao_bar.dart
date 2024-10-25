import '../dto/dto_bar.dart';

abstract class IDAOBar {
  Future<DTOBar> salvar(DTOBar dto);
  Future<DTOBar> alterar(DTOBar dto);
  Future<DTOBar> consultarPorId(int id);
  Future<List<DTOBar>> consultar();
}
