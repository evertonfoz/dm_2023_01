import 'package:flutter/material.dart';

import '../../../models/funcionario.dart';
import 'widgets/nome.dart';

class FuncionarioForm extends StatefulWidget {
  const FuncionarioForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FuncionarioPageState createState() => _FuncionarioPageState();
}

class _FuncionarioPageState extends State<FuncionarioForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _sobrenomeController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Funcionario')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  NomeFuncionarioField(controller: _nomeController),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _sobrenomeController,
                    decoration: const InputDecoration(labelText: 'Sobrenome'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o sobrenome';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _enderecoController,
                    decoration: const InputDecoration(labelText: 'Endereco'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o endereço';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _telefoneController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.go,
                    decoration: const InputDecoration(labelText: 'Telefone'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o telefone';
                      }
                      return null;
                    },
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  FocusScope.of(context).unfocus();

                  if (_formKey.currentState!.validate()) {
                    final funcionario = Funcionario(
                      nome: _nomeController.text,
                      sobrenome: _sobrenomeController.text,
                      endereco: _enderecoController.text,
                      telefone: _telefoneController.text,
                    );

                    final db = await Funcionario.openDb();
                    await Funcionario.create(
                      funcionario,
                    );
                    await db.close();
                  }
                },
                child: const Text('Gravar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
