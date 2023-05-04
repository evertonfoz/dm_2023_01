import 'package:aula5/departamento/data/model/departamento.dart';
import 'package:aula5/funcionario/data/model/funcionario.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../pages/departamento/departamento_new.dart';
import '../../shared/widgets/app_listtile.dart';
import '../../widgets/drawer_pages.dart';
import '../data/datasources/list.dart';

class DepartamentoList extends StatefulWidget {
  const DepartamentoList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FuncionarioPageState createState() => _FuncionarioPageState();
}

class _FuncionarioPageState extends State<DepartamentoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: const Text('Departamentos'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: FutureBuilder<List<DepartamentoModel>>(
          future: DepartamentoListDataSource().getAll(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.done:
                final List<DepartamentoModel> departamentos = snapshot.data;
                if (departamentos.isEmpty) {
                  return const Center(
                    child:
                        Text('Ainda não foi registrado nenhum departamento.'),
                  );
                }
                return ListView.builder(
                  itemCount: departamentos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final DepartamentoModel departamento = departamentos[index];

                    return AppListTile(
                      isOdd: index.isOdd,
                      title: departamento.nome,
                      line01Text: departamento.descricao,
                      imageURL:
                          'https://unicardio.com.br/wp-content/uploads/2020/11/4-cuidados-com-o-coracao-das-criancas.png',
                    );
                  },
                );
              default:
                return Container(
                  color: Colors.red,
                );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DepartamentoNew()),
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
