import 'package:sqflite/sqflite.dart';

class Empresa {
  int? id;
  String nome;
  String endereco;
  String telefone;

  Empresa({
    this.id,
    required this.nome,
    required this.endereco,
    required this.telefone,
  });

  static const String table = 'empresas';

  static Future<Database> openDb() async {
    final db = await openDatabase(
      'empresas.db',
      version: 1,
      onCreate: (db, version) {
        return Empresa.createTable(db);
      },
    );
    return db;
  }

  static Future<void> createTable(Database db) async {
    final db = await openDb();
    await db.execute('''
      CREATE TABLE $table (
        id INTEGER PRIMARY KEY,
        nome TEXT,
        endereco TEXT,
        telefone TEXT
      )
    ''');
  }

  static Future<int> create(Empresa empresa) async {
    final db = await openDb();
    return await db.insert(table, empresa.toMap());
  }

  static Future<List<Empresa>> readAll() async {
    final db = await openDb();
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return Empresa.fromMap(maps[i]);
    });
  }

  static Future<Empresa?> read(int id) async {
    final db = await openDb();
    final List<Map<String, dynamic>> maps =
        await db.query(table, where: 'id = ?', whereArgs: [id], limit: 1);
    if (maps.isNotEmpty) {
      return Empresa.fromMap(maps.first);
    } else {
      return null;
    }
  }

  static Future<int> update(
    Empresa empresa,
  ) async {
    final db = await openDb();
    return await db.update(table, empresa.toMap(),
        where: 'id = ?', whereArgs: [empresa.id]);
  }

  static Future<int> delete(
    int id,
  ) async {
    final db = await openDb();
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'endereco': endereco,
      'telefone': telefone,
    };
  }

  static Empresa fromMap(Map<String, dynamic> map) {
    return Empresa(
      id: map['id'],
      nome: map['nome'],
      endereco: map['endereco'],
      telefone: map['telefone'],
    );
  }
}
