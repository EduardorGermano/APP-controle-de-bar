import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import 'app/banco/sqlite/script.dart';

class Conexao {
  static late Database _db;

  static Future<Database> abrir() async {
    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
    }
    var path = join(await getDatabasesPath(), 'banco.db');
    deleteDatabase(path);
    print('Banco aberto');
    _db = await openDatabase(path, version: 1, onCreate: (db, version) {
      print('Criando e inserindo registros');
      criarTabelas.forEach(db.execute);
      insercoes.forEach(db.execute);
    }, singleInstance: true);
    return _db;
  }
}
