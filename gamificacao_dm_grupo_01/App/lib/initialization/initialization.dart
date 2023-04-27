import 'package:aula5/settings/presentation/mobx/configuracoes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../departamento/presentation/list.dart';
import '../pages/cliente/cliente_list.dart';
import '../pages/empresa/empresa_list.dart';
import '../funcionario/presentation/list.dart';
import '../pages/projeto/projeto_list.dart';
import '../pages/tarefa/tarefa_list.dart';
import '../settings/presentation/configuracoes.dart';
import '../shared/functions/dark_mode_control.dart';

// ignore: must_be_immutable
class TaskManagerApp extends StatelessWidget {
  late SettingsStore _settingsStore;

  TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    _settingsStore = Modular.get<SettingsStore>();
    getDarkModeStatus().then((darkModeStatus) {
      _settingsStore.toggleDarkModeStatus(status: darkModeStatus);
    });

    return Observer(builder: (context) {
      return MaterialApp(
        title: 'Pfe',
        routes: {
          '/': (context) => FuncionarioList(),
          '/funcionario': (context) => FuncionarioList(),
          '/departamento': (context) => const DepartamentoList(),
          '/projeto': (context) => ProjetoList(),
          '/cliente': (context) => const ClienteList(),
          '/tarefa': (context) => const TarefaList(),
          '/empresa': (context) => const EmpresaList(),
          '/configuracao': (context) => SettingsPage(),
        },
        theme: _settingsStore.darkModeStatus
            ? ThemeData.dark()
            : ThemeData.light(),
      );
    });
  }
}
