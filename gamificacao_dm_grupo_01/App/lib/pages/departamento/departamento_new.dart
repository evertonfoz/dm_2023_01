import 'package:aula5/models/departamento.dart';
import 'package:flutter/material.dart';

class DepartamentoNew extends StatefulWidget {
  const DepartamentoNew({Key? key}) : super(key: key);

  @override
  _DepartamentoNewState createState() => _DepartamentoNewState();
}

class _DepartamentoNewState extends State<DepartamentoNew> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _dascricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar departamento')),
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
                        return 'Por favor, insira o nome do departamento';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _dascricaoController,
                    decoration: const InputDecoration(labelText: 'Descricao'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o endereço do departamento';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final departamento = Departamento(
                      nome: _nomeController.text,
                      descricao: _dascricaoController.text,
                    );

                    final db = await Departamento.openDb();
                    await Departamento.create(departamento);
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
