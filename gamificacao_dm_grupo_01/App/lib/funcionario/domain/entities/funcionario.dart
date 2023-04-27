class FuncionarioEntity {
  final int? funcionarioID;
  final String nome;
  final String sobrenome;
  final String endereco;
  final String telefone;
  // List<Tarefa> tarefas;

  const FuncionarioEntity({
    this.funcionarioID,
    required this.nome,
    required this.sobrenome,
    required this.endereco,
    required this.telefone,
    // this.tarefas = const [],
  });

  String get nomeCompleto => '$nome $sobrenome';
}
