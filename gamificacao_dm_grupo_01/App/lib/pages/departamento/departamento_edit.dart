import 'package:aula5/models/departamento.dart';
import 'package:flutter/material.dart';

class DepartamentoEdit extends StatefulWidget {
  final Departamento departamento;

  const DepartamentoEdit({Key? key, required this.departamento})
      : super(key: key);

  @override
  _DepartamentoEditState createState() => _DepartamentoEditState();
}

class _DepartamentoEditState extends State<DepartamentoEdit> {
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nomeController.text = widget.departamento.nome!;
    _descricaoController.text = widget.departamento.descricao!;
  }

  Future<void> _salvarDepartamento(depar) async {
    final retorno = await depar.update(depar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Departamento')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                TextFormField(
                  controller: _nomeController,
                  decoration: const InputDecoration(labelText: 'Nome'),
                ),
                TextFormField(
                  controller: _descricaoController,
                  decoration: const InputDecoration(labelText: 'Descricao'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                final departamento = Departamento(
                  id: widget.departamento.id,
                  nome: _nomeController.text,
                  descricao: _descricaoController.text,
                );

                _salvarDepartamento(departamento);
              },
              child: const Text('Gravar'),
            ),
          ],
        ),
      ),
    );
  }
}
