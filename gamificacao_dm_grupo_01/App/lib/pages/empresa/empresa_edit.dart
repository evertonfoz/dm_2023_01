import 'package:aula5/models/empresa.dart';
import 'package:flutter/material.dart';

class EmpresaEdit extends StatefulWidget {
  final Empresa empresa;

  const EmpresaEdit({Key? key, required this.empresa}) : super(key: key);

  @override
  _EmpresaPageState createState() => _EmpresaPageState();
}

class _EmpresaPageState extends State<EmpresaEdit> {
  final _nomeController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _telefoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nomeController.text = widget.empresa.nome;
    _enderecoController.text = widget.empresa.endereco;
    _telefoneController.text = widget.empresa.telefone;
  }

  Future<void> _salvarEmpresa(data) async {
    final retorno = await Empresa.update(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Empresa')),
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
                final empresa = Empresa(
                  id: widget.empresa.id,
                  nome: _nomeController.text,
                  endereco: _enderecoController.text,
                  telefone: _telefoneController.text,
                );

                _salvarEmpresa(empresa);
              },
              child: const Text('Gravar'),
            ),
          ],
        ),
      ),
    );
  }
}
