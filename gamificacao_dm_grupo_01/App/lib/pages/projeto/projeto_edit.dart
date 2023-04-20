import 'package:aula5/models/projeto.dart';
import 'package:flutter/material.dart';

class ProjetoEdit extends StatefulWidget {
  final Projeto projeto;

  const ProjetoEdit({Key? key, required this.projeto}) : super(key: key);

  @override
  _ProjetoListState createState() => _ProjetoListState();
}

class _ProjetoListState extends State<ProjetoEdit> {
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _dataInicialController = TextEditingController();
  final _dataFinalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nomeController.text = widget.projeto.nome!;
    _descricaoController.text = widget.projeto.descricao!;
    _dataInicialController.text = widget.projeto.dataInicio!;
    _dataFinalController.text = widget.projeto.dataTermino!;
  }

  Future<void> _salvar(data) async {
    final retorno = await Projeto.update(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar projeto')),
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
                TextFormField(
                  controller: _dataInicialController,
                  decoration: const InputDecoration(labelText: 'Data Inicial'),
                ),
                TextFormField(
                  controller: _dataFinalController,
                  decoration: const InputDecoration(labelText: 'Data final'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                final projeto = Projeto(
                  id: widget.projeto.id,
                  nome: _nomeController.text,
                  descricao: _descricaoController.text,
                  dataInicio: _dataInicialController.text,
                  dataTermino: _dataFinalController.text,
                );

                _salvar(projeto);
              },
              child: const Text('Gravar'),
            ),
          ],
        ),
      ),
    );
  }
}
