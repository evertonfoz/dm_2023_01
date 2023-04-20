import 'package:aula5/models/projeto.dart';
import 'package:flutter/material.dart';

class ProjetoNew extends StatefulWidget {
  const ProjetoNew({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProjetoListState createState() => _ProjetoListState();
}

class _ProjetoListState extends State<ProjetoNew> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _dataInicialController = TextEditingController();
  final TextEditingController _dataFinalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Projeto')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o nome ';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descricaoController,
                    decoration: const InputDecoration(labelText: 'Descricao'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a descricao';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _dataInicialController,
                    decoration:
                        const InputDecoration(labelText: 'Data Inicial'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a data inicial';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _dataFinalController,
                    decoration: const InputDecoration(labelText: 'Data Final'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a data final';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final projeto = Projeto(
                      nome: _nomeController.text,
                      descricao: _descricaoController.text,
                      dataInicio: _dataInicialController.text,
                      dataTermino: _dataFinalController.text,
                    );

                    final db = await Projeto.openDb();
                    await Projeto.create(
                      projeto,
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
