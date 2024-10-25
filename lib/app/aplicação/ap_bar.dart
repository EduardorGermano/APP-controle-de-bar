import '../banco/sqlite/dao/dao_bar.dart';
import '../dominio/dto/dto_bar.dart';
import '../dominio/interface/i_dao_bar.dart';
import '../dominio/bar.dart';

class APBar {
  late IDAOBar dao;
  late Bar dominio;

  APProfessor() {
    dao = DAOBar();
    dominio = Bar(dao: dao);
  }

  Future<DTOBar> salvar(DTOBar dto) async {
    return await dominio.salvar(dto);
  }

  Future<DTOBar> alterar(dynamic id) async {
    return await dominio.alterar(id);
  }

  Future<bool> excluir(dynamic id) async {
    await dominio.alterar(id);
    return true;
  }

  Future<List<DTOBar>> consultar() async {
    return await dominio.consultar();
  }
}
