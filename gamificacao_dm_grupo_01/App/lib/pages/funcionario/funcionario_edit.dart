import 'package:aula5/models/funcionario.dart';
import 'package:flutter/material.dart';

class FuncionarioEdit extends StatefulWidget {
  final Funcionario funcionario;

  const FuncionarioEdit({Key? key, required this.funcionario})
      : super(key: key);

  @override
  _FuncionarioPageState createState() => _FuncionarioPageState();
}

class _FuncionarioPageState extends State<FuncionarioEdit> {
  final _nomeController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _sobrenomeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nomeController.text = widget.funcionario.nome!;
    _sobrenomeController.text = widget.funcionario.sobrenome!;
    _enderecoController.text = widget.funcionario.endereco!;
    _telefoneController.text = widget.funcionario.telefone!;
  }

  Future<void> _salvar(data) async {
    final retorno = await Funcionario.update(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Funcionario')),
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
                  controller: _sobrenomeController,
                  decoration: const InputDecoration(labelText: 'Sobrenome'),
                ),
                TextFormField(
                  controller: _enderecoController,
                  decoration: const InputDecoration(labelText: 'Endereco'),
                ),
                TextFormField(
                  controller: _telefoneController,
                  decoration: const InputDecoration(labelText: 'Telefone'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                final funcionario = Funcionario(
                  id: widget.funcionario.id,
                  nome: _nomeController.text,
                  sobrenome: _sobrenomeController.text,
                  endereco: _enderecoController.text,
                  telefone: _telefoneController.text,
                );

                _salvar(funcionario);
              },
              child: const Text('Gravar'),
            ),
          ],
        ),
      ),
    );
  }
}
