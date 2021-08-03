import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static DataBaseHelper _dataBaseHelper;
  static Database _database;

//definicao de tabelas

  DataBaseHelper._createInstance();

  factory DataBaseHelper() {
    if (_dataBaseHelper == null) {
      _dataBaseHelper = DataBaseHelper._createInstance();
    }
    return _dataBaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'bluetoothautomacaoresidencial.db';

    var itensDataBase = await openDatabase(path, version: 1, onCreate: _createDb);
    return itensDataBase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
      'CREATE TABLE [tb_agendamento] ( ' +
        '[id_agendamento] INTEGER  UNIQUE NULL PRIMARY KEY,' +
        '[nome_agendamento] VARCHAR(50)  NULL,' +
        '[inicio_agendamento] VARCHAR(30)  NULL,' +
        '[fim_agendamento] VARCHAR(30)  NULL,' +
        '[status_agendamento] VARCHAR(6)  NULL,' +
        '[status_notificacao] VARCHAR(6)  NULL,' +
        '[mac_adress] VARCHAR(30)  NULL,' +
        '[datetime_save] VARCHAR(30)  NULL'
      ')'
    );  
    //await db.execute(
    //  '');  
  } 
}
