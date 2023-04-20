import 'package:flutter/material.dart';

class TarefaNew extends StatefulWidget {
  const TarefaNew({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TarefaListState createState() => _TarefaListState();
}

class _TarefaListState extends State<TarefaNew> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _dataInicioController = TextEditingController();
  final TextEditingController _dataTerminoController = TextEditingController();
  final TextEditingController _statusTerminoController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Tarefa')),
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
                    controller: _descricaoController,
                    decoration: const InputDecoration(labelText: 'Descricao'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a descricao ';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _dataInicioController,
                    decoration: const InputDecoration(labelText: 'Data Inicio'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a data inicial';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _dataTerminoController,
                    decoration: const InputDecoration(labelText: 'Data final'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a data final';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _statusTerminoController,
                    decoration: const InputDecoration(labelText: 'Status'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira status';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // final tarefa = Tarefa(
                    //   descricao: _descricaoController.text,
                    //   dataInicio: _dataInicioController.text,
                    //   dataTermino: _dataTerminoController.text,
                    //   status: 'terminada',
                    //   funcionario: '1',
                    //   cliente: '1',
                    //   departamento: '1',
                    //   projeto: '1',
                    // );

                    // final db = await Tarefa.openDb();
                    // await Tarefa.create(tarefa);
                    // await db.close();
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
