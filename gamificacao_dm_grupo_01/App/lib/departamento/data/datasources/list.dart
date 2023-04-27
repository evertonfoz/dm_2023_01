import 'package:aula5/core/database/sqflite_database.dart';

import '../model/departamento.dart';

class DepartamentoListDataSource {
  Future<List<DepartamentoModel>> getAll() async {
    final db = await SqfliteDatabase.openDb();
    final List<Map<String, dynamic>> maps =
        await db.query(departamentoTableName);
    return List.generate(maps.length, (i) {
      return DepartamentoModel.fromJson(maps[i]);
    });
  }
}
