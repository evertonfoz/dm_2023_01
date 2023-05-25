import 'package:hasura_connect/hasura_connect.dart' hide Response;
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

import 'departamentos/resource.dart';

class AppModule extends Module {
  final String hasuraServerURL;
  final String hasuraGraphQLAdminSecret;

  AppModule({
    required this.hasuraGraphQLAdminSecret,
    required this.hasuraServerURL,
  });

  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => HasuraConnect(
            hasuraServerURL,
            headers: {'x-hasura-admin-secret': hasuraGraphQLAdminSecret},
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        Route.get('/', () => Response.ok('tudo funcionandoo')),
        Route.resource(DepartamentosResource()),
      ];
}
