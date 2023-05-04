import 'package:aula5/funcionario/data/model/funcionario.dart';

import '../../../core/database/sqflite_database.dart';

class FuncionarioUpdateDataSource {
  Future<int> update({required FuncionarioModel funcionarioModel}) async {
    final db = await SqfliteDatabase.openDb();
    return await db.update(
      funcionarioTableName,
      funcionarioModel.toJson(),
      where: 'funcionarioID = ?',
      whereArgs: [funcionarioModel.funcionarioID],
    );
  }
}
