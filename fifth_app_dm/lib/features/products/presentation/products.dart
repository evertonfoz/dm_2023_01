import 'dart:convert' as convert;

import 'package:first_app_dm/features/products/domain/coin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../domain/fact.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Coin>>(
      future: _getProductsService(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final coin = snapshot.data![index];
                  return ListTile(
                    title: Text(coin.code),
                    subtitle: Text(coin.rate),
                  );
                },
              );
            }
            return Center(
              child: Text('Nada retornado'),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<List<Coin>> _getProductsService() async {
    var response = await http
        .get(Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json'));
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var coins = jsonResponse['bpi'] as Map<String, dynamic>;

      List<Coin> listCoins = [];

      coins.forEach((key, value) {
        listCoins.add(Coin(
          code: value['code'],
          description: value['description'],
          rate: value['rate'],
          rate_float: value['rate_float'],
          symbol: value['symbol'],
        ));
      });
      return listCoins;
    } else {
      throw Exception();
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
