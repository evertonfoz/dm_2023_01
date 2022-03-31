import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

const String kTableUser = 'User';

_createDatabase({required String databaseName}) async {
  var databasesPath = await sqflite.getDatabasesPath();
  return join(databasesPath, databaseName);
}

openDatabase({required String databaseName}) async {
  var databasePath = await _createDatabase(databaseName: databaseName);

  sqflite.Database database = await sqflite.openDatabase(databasePath,
      version: 1, onCreate: (sqflite.Database db, int version) async {
    await db.execute(
      'CREATE TABLE $kTableUser (email TEXT PRIMARY KEY, password TEXT, phone TEXT)',
    );
  });
  return database;
}
