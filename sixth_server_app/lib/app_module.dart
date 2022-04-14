import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:sixth_server_app/datasource/produtos_datasource.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => ProdutosDataSource()),
      ];

  @override
  List<ModularRoute> get routes => [
        Route.post('/produtos', () => Response.ok('OK')),
        Route.get('/', () => Response.ok('Hello World!')),
        Route.get(
          '/produtos',
          () => Response.ok(
            jsonEncode({
              'id': 1,
            }),
            headers: {"content-type": "application/json"},
          ),
          // Modular.get<ProdutosDataSource>().produtos(),
        ),
      ];
}
