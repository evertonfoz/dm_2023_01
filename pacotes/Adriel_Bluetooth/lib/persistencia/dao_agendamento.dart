

import 'package:automacaoresidencial/dataBaseSQLite/database.dart';
import 'package:automacaoresidencial/model/model_agendamento.dart';
import 'package:sqflite/sqflite.dart';

class DaoAgendamento{


  //Tabela Agendamentos
  String tbAgendamento      = 'tb_agendamento';
  String idAgendamento      = 'id_agendamento';
  String nomeAgendamento    = 'nome_agendamento';
  String inicioAgendamento  = 'inicio_agendamento';
  String fimAgendamento     = 'fim_agendamento';
  String statusAgendamento  = 'status_agendamento';
  String statusNotificacao  = 'status_notificacao';
  String macAdress          = 'mac_adress';
  String dateTimeSave       = 'datetime_save';

//INSERT
  Future<Null> insert(ModAgendamento dados) async {
    DataBaseHelper dbHelper = new DataBaseHelper();
    Database db = await dbHelper.database;

    await db.insert(tbAgendamento, dados.setMap());

    return null;
  }

//GET
  Future<List<ModAgendamento>> geAllDados() async {
    List<ModAgendamento> allDados = <ModAgendamento>[];
    DataBaseHelper dbHelper = new DataBaseHelper();
    Database db = await dbHelper.database;

    List<Map> maps = await db.query(
      tbAgendamento,
      columns: [
        idAgendamento,
        nomeAgendamento,
        inicioAgendamento,
        fimAgendamento,
        statusAgendamento,
        statusNotificacao,
        macAdress,
        dateTimeSave    
      ],
    );

    for (Map<String, dynamic> itens in maps) {
      ModAgendamento modelDados = ModAgendamento.getMap(itens);
      allDados.add(modelDados);
    }

    if (maps.length > 0) {
      return allDados;
    } else {
      return null;
    }
  }

//UPDATE
  Future<int> update(ModAgendamento dados) async {
    DataBaseHelper dbHelper = new DataBaseHelper();
    Database db = await dbHelper.database;
    var result = await db.update(
      tbAgendamento,
      dados.setMap(),
      where: "$idAgendamento = ?",
      whereArgs: [dados.idAgendamento],
    );
    return result;
  }

  //DELETE
  Future<int> delete(ModAgendamento dados) async {
    DataBaseHelper dbHelper = new DataBaseHelper();
    Database db = await dbHelper.database;
    var result = await db.delete(
      tbAgendamento,
      where: "$idAgendamento = ?",
      whereArgs: [dados.idAgendamento],
    );
    return result;
  }


}