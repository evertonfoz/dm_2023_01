import '../../../core/database/sqflite_database.dart';
import '../model/funcionario.dart';

class FuncionarioInsertDataSource {
  Future<int> insert({required FuncionarioModel funcionario}) async {
    final db = await SqfliteDatabase.openDb();
    return await db.insert(
      funcionarioTableName,
      funcionario.toJson(),
    );
  }
}
