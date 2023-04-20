import 'package:aula5/pages/tarefa/tarefa_new.dart';
import 'package:flutter/material.dart';
import '../../models/tarefa.dart';
import '../../widgets/drawer_pages.dart';
import 'tarefa_edit.dart';

class TarefaList extends StatefulWidget {
  const TarefaList({Key? key}) : super(key: key);

  @override
  _TarefaListState createState() => _TarefaListState();
}

class _TarefaListState extends State<TarefaList> {
  List<Tarefa> _tarefas = [];

  void getTarefas() async {
    var tarefas = await Tarefa.readAll();
    setState(() {
      _tarefas = tarefas;
    });
  }

  @override
  void initState() {
    super.initState();
    getTarefas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _tarefas.length,
        itemBuilder: (BuildContext context, int index) {
          final tarefa = _tarefas[index];

          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(tarefa.descricao),
                const SizedBox(width: 5),
                Text(tarefa.dataInicio as String),
                const SizedBox(width: 5),
                Text(tarefa.dataTermino as String),
                const SizedBox(width: 5),
                Text(tarefa.status),
                const SizedBox(width: 5),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TarefaEdit(tarefa: tarefa)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TarefaNew()),
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
