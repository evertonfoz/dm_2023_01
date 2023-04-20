import 'package:aula5/models/funcionario.dart';
import 'package:aula5/pages/funcionario/funcionario_edit.dart';
import 'package:flutter/material.dart';

import '../../widgets/drawer_pages.dart';
import 'crud.dart';

class FuncionarioList extends StatefulWidget {
  @override
  _FuncionarioPageState createState() => _FuncionarioPageState();
}

class _FuncionarioPageState extends State<FuncionarioList> {
  List<Funcionario> _funcionarios = [];

  void getFuncionarios() async {
    var funcionarios = await Funcionario.readAll();
    setState(() {
      _funcionarios = funcionarios;
    });
  }

  @override
  void initState() {
    super.initState();
    getFuncionarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Funcionarios'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _funcionarios.length,
        itemBuilder: (BuildContext context, int index) {
          final funcionario = _funcionarios[index];

          return Container(
            decoration: BoxDecoration(
                color:
                    index.isOdd ? Colors.green.shade100 : Colors.green.shade200,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 4,
                      blurRadius: 50)
                ]),
            child: Container(
              color: Colors.amber,
              width: 100,
              height: 100,
              child: Image.network(
                'https://tudocommoda.com/wp-content/uploads/2022/01/pessoa-interessante.png',
                fit: BoxFit.cover,
              ),
            ),
            // child: ListTile(
            //   leading: Container(
            //     color: Colors.amber,
            //     width: 100,
            //     height: 100,
            //     child: Image.network(
            //       'https://tudocommoda.com/wp-content/uploads/2022/01/pessoa-interessante.png',
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // title: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Text(funcionario.nome ?? ''),
            //     const SizedBox(width: 5),
            //     Text(funcionario.sobrenome ?? ''),
            //     const SizedBox(width: 5),
            //     Text(funcionario.endereco ?? ''),
            //     const SizedBox(width: 5),
            //     Text(funcionario.telefone ?? ''),
            //     const SizedBox(width: 5),
            //   ],
            // ),
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => FuncionarioEdit(
            //               funcionario: funcionario,
            //             )),
            //   );
            // },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FuncionarioForm()),
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
