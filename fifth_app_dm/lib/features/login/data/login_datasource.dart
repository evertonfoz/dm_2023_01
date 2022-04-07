import 'package:first_app_dm/core/data/sqflite_database.dart';
import 'package:first_app_dm/features/login/domain/user_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

class LoginDatasource {
  Future saveUser(UserEntity userEntity) async {
    final sqflite.Database database = await openDatabase(
      databaseName: 'utfpr.db',
    );

    await database.insert(
      kTableUser,
      userEntity.toJson(),
      conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
    );

    await database.close();
  }

  Future<UserEntity?> getUser(String email) async {
    final sqflite.Database database = await openDatabase(
      databaseName: 'utfpr.db',
    );

    List<Map<String, Object?>> maps = await database.query(kTableUser,
        columns: ['email', 'password', 'phone'],
        where: 'email = ?',
        whereArgs: [email]);
    if (maps.isNotEmpty) {
      return UserEntity.fromJson(maps.first);
    }
    return null;
  }
}
