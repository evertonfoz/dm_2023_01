import 'dart:convert';

import 'package:aula5/funcionario/data/model/funcionario.dart';
import 'package:http/http.dart' as http;

class FuncionarioListRemoteAPIDataSource {
  Future<List<FuncionarioModel>> getAll() async {
    var client = http.Client();
    final result = <FuncionarioModel>[];
    try {
      final response = await client.get(
        Uri.parse(
          'http://10.55.0.4:8000/Funcionarios',
        ),
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200 && response.body.isNotEmpty) {
        var bodyResult = json.decode(response.body);
        bodyResult.forEach((element) {
          result.add(FuncionarioModel.fromJson(element));
        });
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return result;
  }
}
