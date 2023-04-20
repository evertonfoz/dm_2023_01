import 'package:sqflite/sqflite.dart';

import 'funcionario.dart';
import 'cliente.dart';
import 'departamento.dart';
import 'projeto.dart';

class Tarefa {
  int? id;
  String descricao;
  DateTime dataInicio;
  DateTime dataTermino;
  String status;
  Funcionario funcionario;
  Cliente cliente;
  Departamento? departamento;
  Projeto? projeto;

  Tarefa({
    this.id,
    required this.descricao,
    required this.dataInicio,
    required this.dataTermino,
    required this.status,
    required this.funcionario,
    required this.cliente,
    this.departamento,
    this.projeto,
  });

  static const String table = 'tarefas';

  static Future<Database> openDb() async {
    final db = await openDatabase(
      'tarefas.db',
      version: 1,
      onCreate: (db, version) {
        return Tarefa.createTable(db);
      },
    );
    return db;
  }

  static Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE $table (
        id INTEGER PRIMARY KEY,
        descricao TEXT,
        data_inicio INTEGER,
        data_termino INTEGER,
        status TEXT,
        funcionario_id INTEGER,
        cliente_id INTEGER,
        departamento_id INTEGER,
        projeto_id INTEGER,
        FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id) ON DELETE CASCADE,
        FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE,
        FOREIGN KEY (departamento_id) REFERENCES departamentos(id) ON DELETE CASCADE,
        FOREIGN KEY (projeto_id) REFERENCES projetos(id) ON DELETE CASCADE
      )
    ''');
  }

  static Future<int> create(
    Tarefa tarefa,
  ) async {
    final db = await openDb();
    return await db.insert(table, tarefa.toMap());
  }

  static Future<List<Tarefa>> readAll() async {
    final db = await openDb();
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return Tarefa.fromMap(maps[i]);
    });
  }

  static Future<Tarefa?> read(
    int id,
  ) async {
    final db = await openDb();
    final List<Map<String, dynamic>> maps =
        await db.query(table, where: 'id = ?', whereArgs: [id], limit: 1);
    if (maps.isNotEmpty) {
      return Tarefa.fromMap(maps.first);
    } else {
      return null;
    }
  }

  static Future<int> update(
    Tarefa tarefa,
  ) async {
    final db = await openDb();
    return await db
        .update(table, tarefa.toMap(), where: 'id = ?', whereArgs: [tarefa.id]);
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
      'descricao': descricao,
      'data_inicio': dataInicio.millisecondsSinceEpoch,
      'data_termino': dataTermino.millisecondsSinceEpoch,
      'status': status,
      'funcionario_id': funcionario.id,
      'cliente_id': cliente.id,
      'departamento_id': departamento?.id,
      'projeto_id': projeto?.id,
    };
  }

  static Tarefa fromMap(Map<String, dynamic> map) {
    return Tarefa(
      id: map['id'],
      descricao: map['descricao'],
      status: map['status'],
      dataInicio: DateTime.fromMillisecondsSinceEpoch(map['data_inicio']),
      dataTermino: DateTime.fromMillisecondsSinceEpoch(map['data_termino']),
      funcionario:
          Funcionario(id: map['funcionario_id'], nome: map['funcionario_nome']),
      cliente: Cliente(id: map['cliente_id']),
      departamento: map['departamento_id'] != null
          ? Departamento(id: map['departamento_id'])
          : null,
      projeto:
          map['projeto_id'] != null ? Projeto(id: map['projeto_id']) : null,
    );
  }
}
