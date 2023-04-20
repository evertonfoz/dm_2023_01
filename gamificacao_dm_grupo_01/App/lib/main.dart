import 'package:aula5/initialization/module/initialization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'initialization/initialization.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: TaskManagerApp(),
    ),
  );
}
