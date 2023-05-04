import '../../../core/database/sqflite_database.dart';

class FuncionarioDeleteDataSource {
  Future<int> delete({required int id}) async {
    final db = await SqfliteDatabase.openDb();
    return await db.delete(
      funcionarioTableName,
      where: 'funcionarioID = ?',
      whereArgs: [id],
    );
  }
}
