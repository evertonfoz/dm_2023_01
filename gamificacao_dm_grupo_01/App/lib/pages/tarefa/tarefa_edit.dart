import 'package:aula5/models/tarefa.dart';
import 'package:flutter/material.dart';

class TarefaEdit extends StatefulWidget {
  final Tarefa tarefa;

  const TarefaEdit({Key? key, required this.tarefa}) : super(key: key);

  @override
  _TarefaListState createState() => _TarefaListState();
}

class _TarefaListState extends State<TarefaEdit> {
  final _descricaoController = TextEditingController();
  final _dataInicialController = TextEditingController();
  final _dataFinalController = TextEditingController();
  final _statusController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _descricaoController.text = widget.tarefa.descricao;
    _dataInicialController.text = widget.tarefa.dataInicio as String;
    _dataFinalController.text = widget.tarefa.status;
    _statusController.text = widget.tarefa.status;
  }

  Future<void> _salvar(data) async {
    final retorno = await Tarefa.update(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Tarefa')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                TextFormField(
                  controller: _descricaoController,
                  decoration: const InputDecoration(labelText: 'Descricao'),
                ),
                TextFormField(
                  controller: _dataInicialController,
                  decoration: const InputDecoration(labelText: 'Data Inicial'),
                ),
                TextFormField(
                  controller: _dataFinalController,
                  decoration: const InputDecoration(labelText: 'Data final'),
                ),
                TextFormField(
                  controller: _statusController,
                  decoration: const InputDecoration(labelText: 'Status'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                // final tarefa = Tarefa(
                //   id: widget.tarefa.id,
                //   descricao: _descricaoController.text,
                //   dataInicio: _dataInicialController.text,
                //   dataTermino: _dataFinalController.text,
                // );

                // _salvar(tarefa);
              },
              child: const Text('Gravar'),
            ),
          ],
        ),
      ),
    );
  }
}
