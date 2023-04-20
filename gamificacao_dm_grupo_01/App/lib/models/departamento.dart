import 'package:sqflite/sqflite.dart';

class Departamento {
  int? id;
  String? nome;
  String? descricao;

  Departamento({
    this.id,
    this.nome,
    this.descricao,
  });

  static const String table = 'departamentos';

  static Future<Database> openDb() async {
    final db = await openDatabase(
      'departamentos.db',
      version: 1,
      onCreate: (db, version) {
        return Departamento.createTable(db);
      },
    );
    return db;
  }

  static Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE $table (
        id INTEGER PRIMARY KEY,
        nome TEXT,
        descricao TEXT
      )
    ''');
  }

  static Future<int> create(Departamento departamento) async {
    final db = await openDb();
    return await db.insert(table, departamento.toMap());
  }

  static Future<List<Departamento>> readAll() async {
    final db = await openDb();
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return Departamento.fromMap(maps[i]);
    });
  }

  static Future<Departamento?> read(int id) async {
    final db = await openDb();
    final List<Map<String, dynamic>> maps =
        await db.query(table, where: 'id = ?', whereArgs: [id], limit: 1);
    if (maps.isNotEmpty) {
      return Departamento.fromMap(maps.first);
    } else {
      return null;
    }
  }

  static Future<int> update(Departamento departamento) async {
    final db = await openDb();
    return await db.update(table, departamento.toMap(),
        where: 'id = ?', whereArgs: [departamento.id]);
  }

  static Future<int> delete(int id) async {
    final db = await openDb();
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
    };
  }

  static Departamento fromMap(Map<String, dynamic> map) {
    return Departamento(
      id: map['id'],
      nome: map['nome'],
      descricao: map['descricao'],
    );
  }
}
