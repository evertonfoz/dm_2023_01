import 'package:aula5/pages/cliente/cliente_edit.dart';
import 'package:flutter/material.dart';
import 'package:aula5/models/cliente.dart';
import '../../widgets/drawer_pages.dart';
import 'cliente_new.dart';

class ClienteList extends StatefulWidget {
  const ClienteList({Key? key}) : super(key: key);

  @override
  _ClienteListState createState() => _ClienteListState();
}

class _ClienteListState extends State<ClienteList> {
  List<Cliente> _clientes = [];

  @override
  void initState() {
    super.initState();
    _loadClientes();
  }

  Future<void> _loadClientes() async {
    final db = await Cliente.openDb();
    final List<Cliente> clientes = await Cliente.readAll();
    setState(() {
      _clientes = clientes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _clientes.length,
        itemBuilder: (BuildContext context, int index) {
          final cliente = _clientes[index];
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(cliente.nome ?? ''),
                const SizedBox(width: 5),
                Text(cliente.sobrenome ?? ''),
                const SizedBox(width: 5),
                Text(cliente.endereco ?? ''),
                const SizedBox(width: 5),
                Text(cliente.telefone ?? ''),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ClienteEdit(cliente: cliente)),
              ).then((value) {
                if (value != null && value) {
                  _loadClientes();
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ClienteNew()),
          ).then((value) {
            if (value != null && value) {
              _loadClientes();
            }
          });
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: DrawerPage.getWidget(context),
    );
  }
}
