import 'package:aula5/settings/presentation/mobx/configuracoes.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => SettingsStore()),
    AsyncBind<SharedPreferences>((i) => SharedPreferences.getInstance()),
  ];

  @override
  final List<ModularRoute> routes = [
    // ChildRoute(Modular.initialRoute, child: (_, __) => const SearchPage()),
    // ChildRoute('/details',
    //     child: (_, args) => DetailsPage(result: args.data), guards: [GuardT()]),
  ];
}
