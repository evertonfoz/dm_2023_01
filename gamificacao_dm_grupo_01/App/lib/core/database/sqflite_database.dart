import 'package:sqflite/sqflite.dart';

const String funcionarioTableName = 'funcionarios';
const String departamentoTableName = 'departamentos';

class SqfliteDatabase {
  static Future<Database> openDb() async {
    final db = await openDatabase(
      'gamificacao02.db',
      version: 1,
      onCreate: (db, version) {
        return createTables(db);
      },
    );
    return db;
  }

  static Future<void> createTables(Database db) async {
    await db.execute('''
      CREATE TABLE $funcionarioTableName (
        funcionarioID INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        sobrenome TEXT,
        endereco TEXT,
        telefone TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $departamentoTableName (
        departamentoID INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        descricao TEXT
      )
    ''');
  }
}
