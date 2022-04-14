import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductRegister extends StatelessWidget {
  const ProductRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Register'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final Client client = Client();
            try {
              final Response response = await client.get(
                Uri.parse(
                  'http://192.168.102.140:4040/produtos',
                ),
                headers: {
                  'Content-Type': 'application/json',
                  "Access-Control-Allow-Origin": "*"
                  // 'Authorization': 'Bearer $token'
                },
              );
              // final Response response = await client.post(
              //   Uri.parse('http://10.55.0.4:4040/produtos'),
              //   headers: <String, String>{
              //     'Content-Type': 'application/json; charset=UTF-8',
              //   },
              //   body: jsonEncode(<String, dynamic>{
              //     'id': 'a1',
              //     'nome': 'Flutter is awesome',
              //     'preco': 1.0,
              //   }),
              // );

              if (response.statusCode == 200) {
                print('Success');
              } else {
                print('Failed');
              }
            } on Exception catch (e) {
              print('ERRO: $e');
            }
          },
          child: const Text('Registrar'),
        ),
      ),
    );
  }
}
