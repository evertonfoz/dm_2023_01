import 'package:aula5/models/cliente.dart';
import 'package:flutter/material.dart';

class ClienteEdit extends StatefulWidget {
  final Cliente cliente;

  const ClienteEdit({Key? key, required this.cliente}) : super(key: key);

  @override
  _ClienteEditState createState() => _ClienteEditState();
}

class _ClienteEditState extends State<ClienteEdit> {
  final _nomeController = TextEditingController();
  final _sobrenomeController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _telefoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nomeController.text = widget.cliente.nome!;
    _sobrenomeController.text = widget.cliente.sobrenome!;
    _enderecoController.text = widget.cliente.endereco!;
    _telefoneController.text = widget.cliente.telefone!;
  }

  Future<void> _salvar(data) async {
    final retorno = await Cliente.update(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar cliente')),
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
                final cliente = Cliente(
                  id: widget.cliente.id,
                  nome: _nomeController.text,
                  sobrenome: _sobrenomeController.text,
                  endereco: _enderecoController.text,
                  telefone: _telefoneController.text,
                );

                _salvar(cliente);
              },
              child: const Text('Gravar'),
            ),
          ],
        ),
      ),
    );
  }
}
