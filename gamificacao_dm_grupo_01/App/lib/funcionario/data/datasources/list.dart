import 'package:aula5/core/database/sqflite_database.dart';
import 'package:aula5/funcionario/data/model/funcionario.dart';

class FuncionarioListDataSource {
  Future<List<FuncionarioModel>> getAll() async {
    final db = await SqfliteDatabase.openDb();
    final List<Map<String, dynamic>> maps =
        await db.query(funcionarioTableName);
    return List.generate(maps.length, (i) {
      return FuncionarioModel.fromJson(maps[i]);
    });
  }
}
