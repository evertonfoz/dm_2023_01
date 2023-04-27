import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/functions/dark_mode_control.dart';
import 'mobx/configuracoes.dart';

// ignore: must_be_immutable
class SettingsPage extends StatelessWidget {
  SettingsPage({
    super.key,
  });

  // String _language = 'Português';

  @override
  Widget build(BuildContext context) {
    final SettingsStore settingsStore = Modular.get<SettingsStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Preferências',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Text('Modo escuro'),
                const Spacer(),
                Switch(
                  value: settingsStore.darkModeStatus,
                  onChanged: (value) {
                    settingsStore.toggleDarkModeStatus();
                    setDarkModeStatus(value);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Row(
            //   children: [
            //     const Text('Idioma'),
            //     const Spacer(),
            //     DropdownButton<String>(
            //       value: _language,
            //       onChanged: (value) {
            //         // setState(() {
            //         //   _language = value!;
            //         // });
            //       },
            //       items: const [
            //         DropdownMenuItem(
            //             value: 'Português', child: Text('Português')),
            //         DropdownMenuItem(value: 'Inglês', child: Text('Inglês')),
            //       ],
            //     ),
            //   ],
            // ),
            // const Spacer(),
            // ElevatedButton(
            //   onPressed: _onSaveButtonPressed,
            //   child: const Text('Gravar'),
            // ),
          ],
        ),
      ),
    );
  }
}
