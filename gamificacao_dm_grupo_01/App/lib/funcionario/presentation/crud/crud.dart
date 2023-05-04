import 'package:aula5/funcionario/data/model/funcionario.dart';
import 'package:aula5/funcionario/presentation/crud/widgets/botao_gravar.dart';
import 'package:aula5/funcionario/presentation/crud/widgets/sobrenome.dart';
import 'package:aula5/funcionario/presentation/crud/widgets/telefone.dart';
import 'package:flutter/material.dart';

import '../../data/datasources/insert.dart';
import '../../data/datasources/update.dart';
import 'widgets/endereco.dart';
import 'widgets/nome.dart';

class FuncionarioForm extends StatefulWidget {
  final FuncionarioModel? funcionarioModel;

  const FuncionarioForm({
    Key? key,
    this.funcionarioModel,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FuncionarioPageState createState() => _FuncionarioPageState();
}

class _FuncionarioPageState extends State<FuncionarioForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _sobrenomeController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  @override
  void initState() {
    if (widget.funcionarioModel != null) {
      _nomeController.text = widget.funcionarioModel!.nome;
      _sobrenomeController.text = widget.funcionarioModel!.sobrenome;
      _enderecoController.text = widget.funcionarioModel!.endereco;
      _telefoneController.text = widget.funcionarioModel!.telefone;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Funcionario')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  NomeFuncionarioField(controller: _nomeController),
                  SobrenomeFuncionarioField(controller: _sobrenomeController),
                  EnderecoFuncionarioField(
                    controller: _enderecoController,
                  ),
                  TelefoneFuncionarioField(controller: _telefoneController),
                  FuncionarioBotaoGravar(onPressedNovo: () {
                    _nomeController.clear();
                    _sobrenomeController.clear();
                    _enderecoController.clear();
                    _telefoneController.clear();
                  }, onPressed: () async {
                    FocusScope.of(context).unfocus();

                    if (_formKey.currentState!.validate()) {
                      if (widget.funcionarioModel!.funcionarioID == null) {
                        await FuncionarioInsertDataSource().insert(
                          funcionario: FuncionarioModel(
                            nome: _nomeController.text,
                            sobrenome: _sobrenomeController.text,
                            endereco: _enderecoController.text,
                            telefone: _telefoneController.text,
                          ),
                        );
                      } else {
                        await FuncionarioUpdateDataSource().update(
                          funcionarioModel: FuncionarioModel(
                            funcionarioID:
                                widget.funcionarioModel!.funcionarioID,
                            nome: _nomeController.text,
                            sobrenome: _sobrenomeController.text,
                            endereco: _enderecoController.text,
                            telefone: _telefoneController.text,
                          ),
                        );
                      }
                    }
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
