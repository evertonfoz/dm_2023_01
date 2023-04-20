import 'package:aula5/pages/empresa/empresa_edit.dart';
import 'package:aula5/pages/empresa/empresa_new.dart';
import 'package:flutter/material.dart';

import '../../models/empresa.dart';
import '../../widgets/drawer_pages.dart';

class EmpresaList extends StatefulWidget {
  const EmpresaList({Key? key}) : super(key: key);

  @override
  _EmpresaListState createState() => _EmpresaListState();
}

class _EmpresaListState extends State<EmpresaList> {
  List<Empresa> _empresas = [];

  void getEmpreasas() async {
    var empresas = await Empresa.readAll();
    setState(() {
      _empresas = empresas;
    });
  }

  @override
  void initState() {
    super.initState();
    getEmpreasas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empresas'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _empresas.length,
        itemBuilder: (BuildContext context, int index) {
          final empresa = _empresas[index];

          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(empresa.nome),
                const SizedBox(width: 5),
                Text(empresa.endereco),
                const SizedBox(width: 5),
                Text(empresa.telefone),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EmpresaEdit(empresa: empresa)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EmpresaNew()),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: DrawerPage.getWidget(context),
    );
  }
}
