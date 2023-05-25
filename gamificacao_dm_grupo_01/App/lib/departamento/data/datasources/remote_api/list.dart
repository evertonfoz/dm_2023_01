import 'dart:convert';

import 'package:aula5/departamento/data/model/departamento.dart';
import 'package:aula5/funcionario/data/model/funcionario.dart';
import 'package:http/http.dart' as http;

class DepartamentoListRemoteAPIDataSource {
  Future<List<DepartamentoModel>> getAll() async {
    var client = http.Client();
    final result = <DepartamentoModel>[];
    try {
      final response = await client.get(
        Uri.parse(
          'http://10.55.0.4:8085/departamentos',
        ),
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200 && response.body.isNotEmpty) {
        var bodyResult = json.decode(response.body);
        bodyResult['departamentos'].forEach((element) {
          result.add(DepartamentoModel.fromJson(element));
        });
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return result;
  }
}
