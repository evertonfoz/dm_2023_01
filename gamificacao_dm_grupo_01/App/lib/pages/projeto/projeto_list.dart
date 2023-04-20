import 'package:aula5/pages/projeto/projeto_edit.dart';
import 'package:aula5/pages/projeto/projeto_new.dart';
import 'package:flutter/material.dart';

import '../../models/projeto.dart';
import '../../widgets/drawer_pages.dart';

class ProjetoList extends StatefulWidget {
  ProjetoList({Key? key}) : super(key: key);

  @override
  _ProjetoListState createState() => _ProjetoListState();
}

class _ProjetoListState extends State<ProjetoList> {
  List<Projeto> _projetos = [];

  void getProjetos() async {
    var projetos = await Projeto.readAll();
    setState(() {
      _projetos = projetos;
    });
  }

  @override
  void initState() {
    super.initState();
    getProjetos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projetos'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _projetos.length,
        itemBuilder: (BuildContext context, int index) {
          final projeto = _projetos[index];

          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(projeto.nome ?? ''),
                const SizedBox(width: 5),
                Text(projeto.descricao ?? ''),
                const SizedBox(width: 5),
                Text(projeto.dataInicio ?? ''),
                const SizedBox(width: 5),
                Text(projeto.dataTermino ?? ''),
                const SizedBox(width: 5),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProjetoEdit(projeto: projeto)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProjetoNew()),
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
