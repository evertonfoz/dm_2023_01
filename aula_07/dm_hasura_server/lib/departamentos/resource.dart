import 'package:shelf_modular/shelf_modular.dart';

import 'api/get_all_departamentos.dart';

class DepartamentosResource extends Resource {
  @override
  List<Route> get routes => [
        Route.get('/departamentos', getAllDepartamentos),
      ];
}
